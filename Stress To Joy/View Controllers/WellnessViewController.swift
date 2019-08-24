//
//  WellnessViewController.swift
//  Stress To Joy
//
//  Created by Umer Jabbar on 28/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class WellnessViewController: BaseViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var sleepTimeLabel: UILabel!
    @IBOutlet weak var wakeTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .uncover(direction: .down))

        Database.database().reference().child("mindful_exercise").child(AppStateManager.shared.id).observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String:Any] {
                if let isSleeping = dict["isSleeping"] as? Bool, isSleeping {
                    self.stopButton.isHidden = false
                    self.startButton.isHidden = true
                }else{
                    self.stopButton.isHidden = true
                    self.startButton.isHidden = false
                }
                if let sleepTime = dict["sleep"] as? String {
                    self.sleepTimeLabel.text = sleepTime
                }else{
                    self.sleepTimeLabel.text = "N/A"
                }
                if let wakeTime = dict["wake"] as? String {
                    self.wakeTimeLabel.text = wakeTime
                }else{
                    self.wakeTimeLabel.text = "N/A"
                }
            }
        }
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        Database.database().reference().child("mindful_exercise").child(AppStateManager.shared.id).setValue([
            "isSleeping": true,
            "sleep": Date().shortTime,
            "wake": self.wakeTimeLabel.text ?? "N/A"
            ])
        self.startButton.isHidden = true
        self.stopButton.isHidden = false
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        Database.database().reference().child("mindful_exercise").child(AppStateManager.shared.id).setValue([
            "isSleeping": false,
            "wake": Date().shortTime,
            "sleep": self.sleepTimeLabel.text ?? "N/A"
            ])
        Database.database().reference().child("mindful_exercise_history").child(AppStateManager.shared.id).childByAutoId().setValue([
            "wake": Date().shortTime,
            "sleep": self.sleepTimeLabel.text ?? "N/A",
            "wakeDate": Date().fullDate
            ])
        self.startButton.isHidden = false
        self.stopButton.isHidden = true
    }
    
}
