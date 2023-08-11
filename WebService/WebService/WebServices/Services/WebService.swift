//
//  ApiService.swift
//  Asistee_Company
//
//  Created by apple on 5/25/22.
//

import Foundation
import UIKit

typealias ApiCompletion <C: Codable> = (_ status: Bool, _ apiMessage: String, _ modelObj: C?) -> Void
typealias RequestParameter <E: Codable, C: Codable> = (request: E, response: C.Type)

class WebService {

    /// Get request
    class func get<C: Codable>(isCustomUrl: Bool = false, urlString: String, responseModel: C.Type, completion: @escaping ApiCompletion<C>) {
        let requestResult = CodableService.checkConnectionAndGenerateRequest(isCustomUrl: isCustomUrl, urlString: urlString, isGet: true)
        guard var request = requestResult.request else {
            completion(false, requestResult.error, nil)
            return
        }
//        request.addValue("TruthRadio@123*", forHTTPHeaderField: "KEY")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")

//        print("the url is \(request.url?.absoluteString ?? "") \nthe headers are \(AppEnvironment.headers)")

        CodableService.getResponseFromSession(isCustomUrl: isCustomUrl, request: request, codableObj: responseModel, completion: completion)
    }

    /// Post request
    class func post<E: Codable, C: Codable>(urlString: String, models: RequestParameter<E, C>, completion: @escaping ApiCompletion<C>) {
        let requestResult = CodableService.checkConnectionAndGenerateRequest(urlString: urlString, isGet: false)
        guard var request = requestResult.request else {
            completion(false, requestResult.error, nil)
            return
        }
        let modelAsDic = try? models.request.asDictionary()
        if let bodyDic = modelAsDic {
            let dicData = bodyDic.percentEncoded
            request.httpBody = dicData
        }

//        print("the url is \(request.url?.absoluteString ?? "") \nthe parameter are \(modelAsDic ?? [:]) \nthe headers are \(AppEnvironment.headers)")

        CodableService.getResponseFromSession(request: request, codableObj: models.response, completion: completion)
    }

    /// Image upload request
    class func imageUpload<E: Codable, C: Codable>(urlString: String, models: RequestParameter<E, C>, imageData: (image: UIImage?, imageKey: String), completion: @escaping ApiCompletion<C>) {
        var dicParameter = [String: Any]()

        let requestResult = CodableService.checkConnectionAndGenerateRequest(urlString: urlString, isGet: false)
        guard var request = requestResult.request else {
            completion(false, requestResult.error, nil)
            return
        }

        let modelAsDic = try? models.request.asDictionary()
        if let bodyDic = modelAsDic {
            dicParameter = bodyDic
            let dicData = bodyDic.percentEncoded
            request.httpBody = dicData
        }

        let mediaImage = UploadMediaModel(mediaType: .image, forKey: imageData.imageKey, withImage: imageData.image)

        let boundary = RequestString.boundry + "\(NSUUID().uuidString)"
        request.setValue(RequestString.multiplePartFormData + boundary, forHTTPHeaderField: RequestString.contentType)

        var dataBody: Data
        if let mediaObj = mediaImage {
            dataBody = RequestBodyClass.createDataBodyForMediaRequest(withParameters: dicParameter, media: [mediaObj], boundary: boundary)
        } else {
            dataBody = RequestBodyClass.createDataBodyForMediaRequest(withParameters: dicParameter, media: [], boundary: boundary)
        }

        request.httpBody = dataBody

//        print("the url is \(request.url?.absoluteString ?? "") \nthe parameter are \(modelAsDic ?? [:]) \nthe headers are \(AppEnvironment.headers)")

        CodableService.getResponseFromSession(request: request, codableObj: models.response, completion: completion)
    }

    /// Multiple image upload request
    class func imageListUpload<E: Codable, C: Codable>(urlString: String, models: RequestParameter<E, C>, imageData: (list: [UIImage]?, imageKey: String), completion: @escaping ApiCompletion<C>) {
        var dicParameter = [String: Any]()

        let requestResult = CodableService.checkConnectionAndGenerateRequest(urlString: urlString, isGet: false)
        guard var request = requestResult.request else {
            completion(false, requestResult.error, nil)
            return
        }

        let modelAsDic = try? models.request.asDictionary()
        if let bodyDic = modelAsDic {
            dicParameter = bodyDic
            let dicData = bodyDic.percentEncoded
            request.httpBody = dicData
        }

        var arrMedia = [UploadMediaModel]()
        if let dataDic = imageData.list {
            for ind in 0..<dataDic.count {
                if let mediaImage = UploadMediaModel(mediaType: .image, forKey: "\(imageData.imageKey)[\(ind)]", withImage: dataDic[ind]) {
                    arrMedia.append(mediaImage)
                }
            }
        }

        let boundary = RequestString.boundry + "\(NSUUID().uuidString)"
        request.setValue(RequestString.multiplePartFormData + boundary, forHTTPHeaderField: RequestString.contentType)

        let dataBody = RequestBodyClass.createDataBodyForMediaRequest(withParameters: dicParameter, media: arrMedia, boundary: boundary)
        request.httpBody = dataBody

//        print("the url is \(request.url?.absoluteString ?? "") \nthe parameter are \(modelAsDic ?? [:]) \nthe headers are \(AppEnvironment.headers)")
        CodableService.getResponseFromSession(request: request, codableObj: models.response, completion: completion)
    }

    /// Media upload request
    class func mediaUpload<E: Codable, C: Codable>(urlString: String, models: RequestParameter<E, C>, mediaType: MediaType, fileData: (fileUrl: String, fileKey: String), completion: @escaping ApiCompletion<C>) {
        var dicParameter = [String: Any]()

        let requestResult = CodableService.checkConnectionAndGenerateRequest(urlString: urlString, isGet: false)
        guard var request = requestResult.request else {
            completion(false, requestResult.error, nil)
            return
        }

        let modelAsDic = try? models.request.asDictionary()
        if let bodyDic = modelAsDic {
            dicParameter = bodyDic
            let dicData = bodyDic.percentEncoded
            request.httpBody = dicData
        }

        guard let mediaUrl = URL(string: fileData.fileUrl) else {
            completion(false, ApiMessage.SomethingWentWrong, nil)
            return
        }

        guard let mediaImage = UploadMediaModel(mediaType: mediaType, forKey: fileData.fileKey, fileUrl: mediaUrl) else {
            completion(false, ApiMessage.SomethingWentWrong, nil)
            return
        }

        let boundary = RequestString.boundry + "\(NSUUID().uuidString)"
        request.setValue(RequestString.multiplePartFormData + boundary, forHTTPHeaderField: RequestString.contentType)

        let dataBody = RequestBodyClass.createDataBodyForMediaRequest(withParameters: dicParameter, media: [mediaImage], boundary: boundary)
        request.httpBody = dataBody

//        print("the url is \(request.url?.absoluteString ?? "") \nthe parameter are \(modelAsDic ?? [:]) \nthe headers are \(AppEnvironment.headers)")
        CodableService.getResponseFromSession(request: request, codableObj: models.response, completion: completion)
    }

    /// Multiple media upload request
    class func mediaListUpload<E: Codable, C: Codable>(urlString: String, models: RequestParameter<E, C>, arrMedia: [UploadMediaModel], completion: @escaping ApiCompletion<C>) {
        var dicParameter = [String: Any]()

        let requestResult = CodableService.checkConnectionAndGenerateRequest(urlString: urlString, isGet: false)
        guard var request = requestResult.request else {
            completion(false, requestResult.error, nil)
            return
        }

        let modelAsDic = try? models.request.asDictionary()
        if let bodyDic = modelAsDic {
            dicParameter = bodyDic
            let dicData = bodyDic.percentEncoded
            request.httpBody = dicData
        }

        let boundary = RequestString.boundry + "\(NSUUID().uuidString)"
        request.setValue(RequestString.multiplePartFormData + boundary, forHTTPHeaderField: RequestString.contentType)

        let dataBody = RequestBodyClass.createDataBodyForMediaRequest(withParameters: dicParameter, media: arrMedia, boundary: boundary)
        request.httpBody = dataBody

//        print("the url is \(request.url?.absoluteString ?? "") \nthe parameter are \(modelAsDic ?? [:]) \nthe headers are \(AppEnvironment.headers)")
        CodableService.getResponseFromSession(request: request, codableObj: models.response, completion: completion)
    }
}
