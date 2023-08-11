//
//  SplashVC.swift
//  WebService
//
//  Created by Darshan Dangar on 10/08/23.
//

import UIKit

class SplashVC: UIViewController {
    
    // Mark: Outlets
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var aiProgress: UIActivityIndicatorView!
    
    // Mark: Variables
    let splashVm = SplashVM()
    
    // Mark: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imgLogo.layer.cornerRadius = imgLogo.frame.height / 2
        aiProgress.startAnimating()
        splashVm.callApi()
        bindVM()
    }
    
    func changeVc() {
        guard let loginVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {
            return
        }
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC else {
            return
        }
        if !(UserDefaults.standard.string(forKey: "token")?.isEmpty ?? false) {
            view.window?.rootViewController = homeVC
            view.window?.makeKeyAndVisible()
        } else {
            view.window?.rootViewController = loginVc
            view.window?.makeKeyAndVisible()
        }
    }
    
    
    
    func bindVM() {
        splashVm.status.bind(action: { status in
            if status {
                self.aiProgress.stopAnimating()
                self.aiProgress.hidesWhenStopped = true
                self.changeVc()
            }
        })
    }

}
