//
//  SignInViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 13/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: BaseViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if let email = self.emailTextField.text, !email.isEmpty {
            if let password = self.passwordTextField.text, !password.isEmpty {
                self.signIn(email: email, password: password)
            }else{
                self.showErrorWith(message: "Please type in your password")
            }
        }else{
            self.showErrorWith(message: "Please type in your email")
        }
    }
    
    
    func signIn(email: String, password: String){
        self.startLoading()
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user{
                Database.database().reference().child("users").child(user.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    self.stopLoading()
                    if let dict = snapshot.value as? [String:String] {
                        AppStateManager.shared.f_name =  dict["f_name"] ?? ""
                        AppStateManager.shared.l_name =  dict["l_name"] ?? ""
                        AppStateManager.shared.email =  user.email ?? ""
                        AppStateManager.shared.id =  user.uid
                        self.performSegue(withIdentifier: "goHome", sender: self)
                    }else{
                        self.showErrorWith(message: "Some error occured")
                    }
                })
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
