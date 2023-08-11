//
//  LoginVC.swift
//  WebService
//
//  Created by Darshan Dangar on 09/08/23.
//

import UIKit

class LoginVC: UIViewController {
    
    // Mark: Outlets
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnPasswordVisibility: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var vwPassword: UIView!
    
    // Mark: Variables
    let loginVm = LoginVM()
    
    // Mark: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    // Mark: Initial SetUp
    private func initialSetUp() {
        txtMobileNo.layer.cornerRadius = 10
        txtPassword.layer.cornerRadius = 10
        btnLogin.layer.cornerRadius = 10
        bindVM()
    }
    
    func bindVM() {
        loginVm.isEmpty.bind(action: {_ in
            self.showAlert(alertText: "Plese Enter Text", alertMessage: "Plese Enter Phone No and Password")
        })
        loginVm.isValid.bind(action: { _ in
            self.showAlert(alertText: "Please add valid ", alertMessage: "phone number between 7 to 15 digit")
        })
        loginVm.apiSucess.bind(action: { data in
            guard let token = data?.bearerToken as? String else {
                return
            }
            UserDefaults.standard.set(token, forKey: "token")
            if !(UserDefaults.standard.string(forKey: "token")?.isEmpty ?? false) {
                self.gotoHomeVc()
            }
        })
    }

    
    // Mark: IB Actions
    @IBAction func btnPasswordIsSecure(_ sender: UIButton) {
        txtPassword.isSecureTextEntry.toggle()
        btnPasswordVisibility.isSelected.toggle()
    }
    
    @IBAction func btnForgotPassword(_ sender: UIButton) {
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        loginVm.validation(txtMobileNo.text ?? "", txtPassword.text ?? "")
    }
    
    func gotoHomeVc() {
        guard let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else {
            return
        }
        view.window?.rootViewController = homeVc
        view.window?.makeKeyAndVisible()
    }
    
}
