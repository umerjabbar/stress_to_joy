//
//  MindfulViewController.swift
//  Stress To Joy
//
//  Created by Umer Jabbar on 28/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Firebase

class MindfulViewController: BaseViewController {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }

    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var counter = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .uncover(direction: .down))
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        if self.playButton.isSelected{
            let alert = UIAlertController(title: "Alert", message: "This will close your current activity", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            }))
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
                self.dismiss(animated: true, completion: {
                })
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func uploadData(){
        let alert = UIAlertController(title: "Exercise", message: "Please enter a title for your workout", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields?[0]
            if let text = textField?.text, !text.isEmpty{
                self.showSuccessMessage(message: "Successfully added")
                Database.database().reference().child("mindful_exercise_time").child(AppStateManager.shared.id).childByAutoId().setValue([
                    "time": self.timerLabel.text,
                    "date": "\(Date().shortDate)",
                    "title": "\(text)"
                    ])
                self.dismiss(animated: true, completion: nil)
            }else{
                self.showErrorWith(message: "Please enter a title")
                self.loadingView.startAnimating()
                self.startTimerButtonTapped()
                self.playButton.isSelected = !self.playButton.isSelected
            }
            
            print("Text field: \(textField?.text ?? "Error hae")")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func playButtonAction(_ sender: Any) {
        if self.playButton.isSelected {
            self.loadingView.stopAnimating()
            self.cancelTimerButtonTapped()
            guard self.counter != 0 else{
                return
            }
            self.uploadData()
        }else{
            self.loadingView.startAnimating()
            self.startTimerButtonTapped()
        }
        self.playButton.isSelected = !self.playButton.isSelected
    }
    
    func startTimerButtonTapped() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func cancelTimerButtonTapped() {
        timer.invalidate()
    }
    
    @objc func timerAction() {
        counter += 1
        
        let hours = Int(counter / 3600)
        let minutes = Int(counter / 60 % 60)
        let seconds = Int(counter % 60)
        
//        self.timerLabel.text = String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        self.timerLabel.text = String(format:"%02i:%02i", minutes, seconds)
    }
    
}


