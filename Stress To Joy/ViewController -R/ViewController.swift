//
//  ViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 12/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit

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
        self.performSegue(withIdentifier: "toSignIn", sender: nil)
    }

    
}

