//
//  LoginModel.swift
//  WebService
//
//  Created by Darshan Dangar on 10/08/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try? JSONDecoder().decode(Login.self, from: jsonData)

import Foundation

// MARK: - Login

struct LoginRequestModel: Codable {
    let phone: String
    let password: String
    let deviceType: String
    let deviceToken: String
    let countryCode: String
    
    enum CodingKeys: String, CodingKey {
        case phone
        case password
        case deviceType = "device_type"
        case deviceToken = "device_token"
        case countryCode = "country_code"
    }
}

struct LoginModel: Codable {
    let data: LoginData
    let status: Bool
    let bearerToken, message: String

    enum CodingKeys: String, CodingKey {
        case data, status
        case bearerToken = "bearer_token"
        case message
    }
}

// MARK: - LoginData
struct LoginData: Codable {
    
    let id: Int
    let firstName, lastName, fullName, email: String?
    let phone, countryCode, postalCode: String
    let profilePicture, socialID, socialType: String?
    let isPassword: Bool
    let notifications: Int
    let subscription, isArtistSelected: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case fullName = "full_name"
        case email
        case phone
        case countryCode = "country_code"
        case postalCode = "postal_code"
        case profilePicture = "profile_picture"
        case socialID = "social_id"
        case socialType = "social_type"
        case isPassword = "is_password"
        case notifications, subscription
        case isArtistSelected = "is_artist_selected"
    }
    
}
