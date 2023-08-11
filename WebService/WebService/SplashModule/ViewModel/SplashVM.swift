//
//  File.swift
//  WebService
//
//  Created by Darshan Dangar on 10/08/23.
//

import UIKit

class SplashVM {
    
    var status = Observable<Bool>(value: false)
    
    func callApi() {
        WebService.get(urlString: "api/init/1.1.1/ios", responseModel: Init.self) {status,apiMessage,modelObj in
            print(status)
            self.status.set(status)
            print(apiMessage)
            print(modelObj)
            
        }
    }
    
}
