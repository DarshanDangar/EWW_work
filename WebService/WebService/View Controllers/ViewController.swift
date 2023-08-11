//
//  ViewController.swift
//  WebService
//
//  Created by Darshan Dangar on 09/08/23.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Mark: IB Actions
    @IBAction func btnLogOut(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "token")
        gotoLoginVc()
    }
    
    private func gotoLoginVc() {
        guard let loginVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {
            return
        }
//        self.navigationController?.pushViewController(loginVc, animated: true)
        view.window?.rootViewController = loginVc
        view.window?.makeKeyAndVisible()
    }

}

