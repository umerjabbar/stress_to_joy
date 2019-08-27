//
//  SignupViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 13/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: BaseViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    var email = ""
    var password = ""
    var f_name = ""
    var l_name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if let f_name = self.firstNameField.text, f_name.isEmpty {
            self.showErrorWith(message: "Please type in your first name")
            return
        }else{
            self.f_name = self.firstNameField.text ?? ""
        }
        
        if let l_name = self.lastNameField.text, l_name.isEmpty {
            self.showErrorWith(message: "Please type in your last name")
            return
        }else{
            self.l_name = self.lastNameField.text ?? ""
        }
        
        
        if let email = self.emailTextField.text, !email.isEmpty {
            if let password = self.passwordTextField.text, !password.isEmpty {
                self.signup(email: email, password: password)
            }else{
                self.showErrorWith(message: "Please type in your password")
            }
        }else{
            self.showErrorWith(message: "Please type in your email")
        }
    }
    
    func signup(email: String, password: String){
        self.startLoading()
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let result = authResult {
                Database.database().reference().child("users").child(result.user.uid).setValue([
                    "id": result.user.uid,
                    "f_name": self.f_name,
                    "l_name": self.l_name,
                    "email": result.user.email ?? self.email,
                    ])
                self.stopLoading()
                self.showSuccessMessage(message: "Successfully created")
                self.dismiss(animated: true, completion: nil)
            }else if let err = error {
                self.showErrorWith(message: err.localizedDescription)
                self.stopLoading()
            }else{
                self.showErrorWith(message: "Unknown error occured")
                self.stopLoading()
            }
        }
        
    }
    
    
}
