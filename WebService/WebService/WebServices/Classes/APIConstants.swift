//
//  ApiConsts.swift
//  Asistee_Company
//
//  Created by apple on 5/26/22.
//

import Foundation

enum APIConstants {
    static let HeaderKey = "KEY"
    static let XApiKey = "Authorization"
    static let AppHostKey = "Asistee@123*"
    static let Accept = "Accept"
    static let AcceptValue = "application/json"
    static let ResponseMessage = "message"
    static let ResponseStatus = "status"
}

enum ApiMethods {
    static let GET = "GET"
    static let POST = "POST"
}

enum RequestString {
    static let boundry = "Boundary-"
    static let multiplePartFormData = "multipart/form-data; boundary="
    static let contentType = "Content-Type"
    static let pageKey = "?page="
}

enum ApiMessage {
    static let loginSuccessfully = "You are successfully logged in."
    static let SessionExpired = "You've been logged out. Please log back in."
    static let SomethingWentWrong = "Something went wrong, Please try again."
    static let ServerSideError = "There is some server side error, Please try again after some time!"
    static let NoInternetConnection = "No internet found. Check your connection or try again"
    static let RequestTimeOut = "Poor internet connection, Check your internet connection or try again."
    static let InvalidJsonFormat = "JSON format is invalid."
    static let MaintenanceMessage = "We're currently undergoing scheduled maintenance. We will come back very shortly. \nSorry for the inconvenience!"
    static let otpVerified = "OTP verified successfully"
    static let dataNotAvailable = " is not available"
}
