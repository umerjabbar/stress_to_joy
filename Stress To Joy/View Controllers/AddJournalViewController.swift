//
//  AddJournalViewController.swift
//  Stress To Joy
//
//  Created by Umer Jabbar on 28/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class AddJournalViewController: BaseViewController {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    @IBOutlet weak var point1TextField: UITextField!
    @IBOutlet weak var point2TextField: UITextField!
    @IBOutlet weak var point3TextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .uncover(direction: .down))
        
        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        guard let point1 = self.point1TextField.text, !point1.isEmpty else{
            self.showErrorWith(message: "Please type in point 1")
            return
        }
        guard let point2 = self.point2TextField.text, !point2.isEmpty else{
            self.showErrorWith(message: "Please type in point 2")
            return
        }
        guard let point3 = self.point3TextField.text, !point3.isEmpty else{
            self.showErrorWith(message: "Please type in point 3")
            return
        }
        
        let array = [point1,point2,point3]
        self.startLoading()
        Database.database().reference().child("three_word_gratitude").child(AppStateManager.shared.id).child(Date().fullDate).setValue(array) { (error, snapshot) in
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


