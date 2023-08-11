//
//  Api+Extension.swift
//  Asistee_Company
//
//  Created by apple on 5/26/22.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

extension Dictionary {
    var percentEncoded: Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }

    var queryString: String {
        var output: String = ""
        for (key, value) in self {
            if var each = value as? String {
                each = each.addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
                output += "\(key)=\(each)&"
            } else {
                output += "\(key)=\(value)&"
            }
        }
        output = String(output.dropLast())
        return output
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .millisecondsSince1970
        encoder.outputFormatting = .withoutEscapingSlashes
        let data = try encoder.encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }

        return dictionary
    }

    var toString: String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .withoutEscapingSlashes
        encoder.dateEncodingStrategy = .deferredToDate

        if let data = try? encoder.encode(self), let str = String(data: data, encoding: .utf8) {
            return str
        } else {
            return nil
        }
    }
}

extension URL {
    var queryDictionary: [String: Any]? {
        guard let query = self.query else { return nil}

        var queryStrings = [String: Any]()
        for pair in query.components(separatedBy: "&") {
            let each = pair.removingPercentEncoding ?? ""
            let key = each.components(separatedBy: "=")[0]

            if pair.components(separatedBy: "=").count == 2 {
                let value = each.components(separatedBy: "=")[1].replacingOccurrences(of: "+", with: " ").removingPercentEncoding ?? ""
                queryStrings[key] = value
            }
        }
        return queryStrings
    }
    // usage
    // let urlString = " http://www.youtube.com/video/4bL4FI1Gz6s?hl=it_IT&iv_logging_level=3&ad_flags=0&endscreen_module=http://s.ytimg.com/yt/swfbin/endscreen-vfl6o3XZn.swf&cid=241&cust_gender=1&avg_rating=4.82280613104 "
    // let url = URL(string: urlString)
    // print(url!.queryDictionary ?? "NONE")

    var queryToDictionaryOnFirstLaunch: [String: Any]? {
        guard let query = self.query else { return nil}

        var queryStrings = [String: Any]()
        for pair in query.components(separatedBy: "&") {
            let each = pair//.removingPercentEncoding ?? ""
            let key = each.components(separatedBy: "=")[0]

            if pair.components(separatedBy: "=").count == 2 {
                let value = each.components(separatedBy: "=")[1].replacingOccurrences(of: "+", with: " ").removingPercentEncoding ?? ""
                queryStrings[key] = value
            }
        }
        return queryStrings
    }
}

func getQueryStringParameter(url: String, param: String) -> String? {
    guard let url = URLComponents(string: url) else { return nil }
    return url.queryItems?.first(where: { $0.name == param })?.value
}

extension String {
    var asDiscionary: [String: Any]? {
        if let data = data(using: .utf8) {
            return try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        }
        return nil
    }
}
