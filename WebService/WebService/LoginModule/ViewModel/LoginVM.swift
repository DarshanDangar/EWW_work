//
//  LoginVM.swift
//  WebService
//
//  Created by Darshan Dangar on 10/08/23.
//

import Foundation

class LoginVM {
    
    var isValid = Observable<Bool>(value: false)
    var isEmpty = Observable<Bool>(value: false)
    var user: LoginRequestModel?
    var apiSucess = Observable<LoginModel?>(value: nil)
    
    func validation(_ phoneNo: String, _ password: String) {
        if !phoneNo.isEmpty && !password.isEmpty {
            if phoneNo.count > 7 && phoneNo.count < 15 && password.count > 7 {
                user = LoginRequestModel(phone: phoneNo, password: password, deviceType: "ios", deviceToken: "1234564", countryCode: "1")
                apiresult()
            } else {
                isValid.set(false)
            }
        } else {
            isEmpty.set(true)
        }
    }
    
    func apiresult() {
        WebService.post(urlString: "api/auth/login", models: (request: user, response: LoginModel.self), completion: {status,apiMessage,modelObj in 
            print(status)
            print(apiMessage)
            print(modelObj)
            if status {
                self.apiSucess.set(modelObj)
            }
        })
    }
    
}
