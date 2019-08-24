//
//  ForgotViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 13/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class ForgotViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    var email = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if let email = self.emailTextField.text, !email.isEmpty {
            self.forgotPassword(email: email)
        }else{
            self.showErrorWith(message: "Please type in your email")
        }
    }
    
    
    func forgotPassword(email: String){
        Auth.auth().sendPasswordReset(withEmail: self.email) { (error) in
            if let err = error {
                self.showErrorWith(message: err.localizedDescription)
            }else{
                self.showSuccessMessage(message: "Rest email has been sent to you")
            }
        }
    }

}
