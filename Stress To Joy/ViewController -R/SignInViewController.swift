//
//  SignInViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 13/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Alamofire

class SignInViewController: BaseViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func signIn(){
        
        /**
         login
         get http://transformingdepression.com/auth/login.php
         */
        
        // Add Headers
        let headers = [
            "Cookie":"PHPSESSID=093abdb1e3ef3d241f63c9cb5d8a947e",
        ]
        
        // Add URL parameters
        let urlParams = [
            "email":"umerjabbar456@gmail.com",
            "password":"abcxyz",
        ]
        
        // Fetch Request
        Alamofire.request("http://transformingdepression.com/auth/login.php", method: .get, parameters: urlParams, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if (response.result.error == nil) {
                    debugPrint("HTTP Response Body: \(response.data)")
                }
                else {
                    debugPrint("HTTP Request failed: \(response.result.error)")
                }
        }
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        //        self.topConstraint.constant = 170
        //        self.view.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        UIView.animate(withDuration: 1) {
        //            self.topConstraint.constant = 0
        //            self.view.alpha = 1
        //            self.view.layoutIfNeeded()
        //        }
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
