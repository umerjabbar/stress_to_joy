//
//  SignInViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 13/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
