//
//  SplashModel.swift
//  WebService
//
//  Created by Darshan Dangar on 10/08/23.
//

import Foundation

// MARK: - Init
struct Init: Codable {
    let data: DataClass
    let status: Bool
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let appMenuLink: [AppMenuLink]
    let registerURL: String
    let agoraAppID: String
    let subscriptionURL: String
    let subscription: Bool

    enum CodingKeys: String, CodingKey {
        case appMenuLink = "app_menu_link"
        case registerURL = "register_url"
        case agoraAppID = "agora_app_id"
        case subscriptionURL = "subscription_url"
        case subscription
    }
}

// MARK: - AppMenuLink
struct AppMenuLink: Codable {
    let name, showName: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case showName = "show_name"
        case url
    }
}

