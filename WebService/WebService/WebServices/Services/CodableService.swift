//
//  CodableResponseServiceClass.swift
//  Asistee_Company
//
//  Created by Hiral Jotaniya on 04/06/21.
//

import Foundation
import UIKit

class CodableService {

    /// Get data from api request and parse into generic codable response
    class func getResponseFromSession<C: Codable>(isCustomUrl: Bool = false, request: URLRequest, codableObj: C.Type, completion: @escaping ApiCompletion<C>) {
        guard Reachability.isConnectedToNetwork() else {
            completion(false, ApiMessage.NoInternetConnection, nil)
            return
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {

                guard error == nil else {
                    completion(false, error?.localizedDescription ?? ApiMessage.SomethingWentWrong, nil)
                    return
                }

                // MARK: - HTTP Response
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(false, ApiMessage.SomethingWentWrong, nil)
                    return
                }

                print("Status code of the request:=>", httpResponse.statusCode)

                // MARK: - Response Data
                guard let responseData = data else {
                    completion(false, ApiMessage.SomethingWentWrong, nil)
                    return
                }

                // MARK: - Api Message
                let responseDic = getResponseDicFromData(responseData: responseData) ?? [APIConstants.ResponseMessage: ApiMessage.SomethingWentWrong]
                let alertMessage = getMessageFromApiResponse(param: responseDic)

                print("\n<==API RESPONSE ==> \n \(responseDic)")

                // MARK: - Api Status
                var statusCode: Bool = false
                if let mainDic = responseDic as? [String: Any], let status = mainDic[APIConstants.ResponseStatus] as? Bool {
                    statusCode = status
                }

                // MARK: - Success
                if httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 {
                    if let obj = getCodableObjectFromData(isCustomUrl: isCustomUrl, jsonData: responseData, codableObj: codableObj) {
                        completion(statusCode, alertMessage, obj)
                    } else {
                        completion(false, ApiMessage.InvalidJsonFormat, nil)
                    }

                // MARK: - Request timeout
                } else if alertMessage == ApiMessage.RequestTimeOut {
                    completion(false, ApiMessage.RequestTimeOut, nil)

                // MARK: - Client Side Error
                } else if httpResponse.statusCode == 400 {
                    completion(false, ApiMessage.ServerSideError, nil)

                // MARK: - Session Expoire -> Do Force Logout
                } else if httpResponse.statusCode == 401 || httpResponse.statusCode == 403 {
                    if !isCustomUrl {
//                        UIApplication.topVC()?.showToast(message: ApiMessage.SessionExpired)
//                        SessionManager.shared.logout()
                    }

                // MARK: - Server Error
                } else if httpResponse.statusCode == 500 {
                    completion(false, ApiMessage.ServerSideError, nil)

                // MARK: - Something Went Wrong
                } else {
                    completion(false, ApiMessage.SomethingWentWrong, nil)
                }
            }
        }.resume()
    }

    /// Check internet connection and generate url request
    /// - Parameters:
    ///   - urlString: api url
    ///   - isGet: is get method or post
    /// - Returns: no internet connection message and URLRequest
    class func checkConnectionAndGenerateRequest(isCustomUrl: Bool = false, urlString: String, isGet: Bool) -> (error: String, request: URLRequest?) {
        guard Reachability.isConnectedToNetwork() else {
            return (ApiMessage.NoInternetConnection, nil)
        }

        var url = urlString
        if !isCustomUrl {
            url = (ApiService.baseUrl + urlString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }

        guard let url = URL(string: url) else {
            return (ApiMessage.SomethingWentWrong, nil)
        }

        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.httpMethod = isGet ? ApiMethods.GET : ApiMethods.POST
        if !isCustomUrl {
            request.allHTTPHeaderFields = ["KEY" : "TruthRadio@123*"]
//                                           "Accept" : "application/json"]//AppEnvironment.headers
        }

        return ("", request)
    }

    /// Parse json data into model
    class func getCodableObjectFromData<C: Codable>(isCustomUrl: Bool = false, jsonData: Data, codableObj: C.Type) -> C? {
        if isCustomUrl {
            return String(data: jsonData, encoding: .utf8) as? C
        } else {
            return try? JSONDecoder().decode(codableObj, from: jsonData)
        }
    }

    /// Get dictionary from json data
    class func getResponseDicFromData(responseData: Data) -> Any? {
        return try? JSONSerialization.jsonObject(with: responseData)
    }

    /// Get api message from json response
    class func getMessageFromApiResponse(param: Any) -> String {
        var strMessage: String?

        if let res = param as? String {
            strMessage = res
        } else if let resDict = param as? NSDictionary {
            if let msg = resDict.object(forKey: "message") as? String {
                strMessage = msg
            } else if let msg = resDict.object(forKey: "msg") as? String {
                strMessage = msg
            } else if let msg = resDict.object(forKey: "message") as? [String] {
                strMessage = msg.first
            }
        } else if let resAry = param as? NSArray {
            if let dictIndxZero = resAry.firstObject as? NSDictionary {
                if let msg = dictIndxZero.object(forKey: "message") as? String {
                    strMessage = msg
                } else if let msg = dictIndxZero.object(forKey: "msg") as? String {
                    strMessage = msg
                } else if let msg = dictIndxZero.object(forKey: "message") as? [String] {
                    strMessage = msg.first
                }
            } else if let msg = resAry as? [String] {
                strMessage = msg.first
            }
        }

        return strMessage ?? "" == "" ? ApiMessage.SomethingWentWrong : (strMessage ?? ApiMessage.SomethingWentWrong)
    }
}
