//
//  ViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 12/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//
//        }
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let user = Auth.auth().currentUser {
            AppStateManager.shared.email =  user.email ?? ""
            AppStateManager.shared.id =  user.uid
            self.performSegue(withIdentifier: "goHome", sender: nil)
        }else{
            self.performSegue(withIdentifier: "toSignIn", sender: nil)
        }
    }

    
}

