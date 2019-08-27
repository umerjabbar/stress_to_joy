//
//  AddProritiesViewController.swift
//  Stress To Joy
//
//  Created by Umer Jabbar on 28/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class AddProritiesViewController: BaseViewController {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    @IBOutlet weak var pointTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .uncover(direction: .down))

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        guard let point = self.pointTextField.text, !point.isEmpty else{
            self.showErrorWith(message: "Please type in point")
            return
        }
        self.startLoading()
        Database.database().reference().child("priorities_of_the_day").child(AppStateManager.shared.id).child("\(Date().fullDate)").childByAutoId().setValue(point) { (error, snapshot) in
            self.stopLoading()
            if let err = error {
                self.showErrorWith(message: err.localizedDescription)
            }else{
                self.showSuccessMessage(message: "Successfully added")
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
    
}
