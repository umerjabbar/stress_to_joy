//
//  BaseViewController.swift
//  Stress To Joy
//
//  Created by Umer Jabbar on 28/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Hero

class BaseViewController: UIViewController {
    
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .default
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
        self.navigationController?.hero.isEnabled = true

        // Do any additional setup after loading the view.
    }
    

    func startLoading(){
        LoadingOverlay.shared.showOverlay()
    }
    
    func stopLoading(){
        LoadingOverlay.shared.hideOverlayView()
    }
    
    func showSuccessMessage(message:String?){
        Messages.showSuccessMessage(message: message)
    }
    
    func showErrorWith(message: String?){
        Messages.showErrorWith(message: message)
    }

}
