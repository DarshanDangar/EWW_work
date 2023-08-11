//
//  UploadMediaModel.swift
//  Asistee_Company
//
//  Created by Hiral Jotaniya on 04/06/21.

import Foundation
import UIKit

class UploadMediaModel: Codable {
    let key: String
    let fileName: String
    let data: Data
    let mimeType: String

    init?(mediaType: MediaType, forKey key: String, withImage image: UIImage? = nil, fileUrl url: URL? = nil) {
        self.key = key
        let ext = mediaType.rawValue == MediaType.audio.rawValue ? "m4a" : (url?.pathExtension ?? "")
        self.mimeType = mediaType.rawValue == MediaType.image.rawValue ? "image/jpg" : "\(mediaType.rawValue)/\(ext)"
        self.fileName = mediaType.rawValue == MediaType.image.rawValue ? "image.jpeg" : "\(key).\(ext.lowercased())"

        var mediaData: Data?
        if mediaType.rawValue == MediaType.image.rawValue {
           if let img = image {
                guard let data = img.jpegData(compressionQuality: 0.5) else { return nil }
                mediaData = data
           }
        } else {
            if let mediaUrl = url {
                guard let data = try? Data(contentsOf: mediaUrl) else { return nil }
                mediaData = data
            }
        }

        guard let objData = mediaData else { return nil}
        self.data = objData
    }
}

enum MediaType: String {
    case image = "image"
    case video = "video"
    case audio = "audio"
    case file = "application"
}
