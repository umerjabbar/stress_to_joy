//
//  DashboardViewController.swift
//  Stress To Joy
//
//  Created by Umer Jabbar on 28/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase

class DashboardViewController: BaseViewController {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [
        ("Priorities of the Day", #imageLiteral(resourceName: "travel")),
        ("Today, I am grateful for", #imageLiteral(resourceName: "typewriter")),
        ("Wellness", #imageLiteral(resourceName: "home_dribbble_3")),
        ("Mindful Exercise", #imageLiteral(resourceName: "mindfull")),
        ("Blogs", #imageLiteral(resourceName: "dribble4-1")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.checkForVerification()
        
    }
    
    func checkForVerification(){
        if !(Auth.auth().currentUser?.isEmailVerified ?? true){
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                self.stopLoading()
                if let err = error {
                    self.showErrorWith(message: err.localizedDescription)
                }else{
                    self.showSuccessMessage(message: "Verification email has been sent to you")
                }
            })
        }
    }
    
    @IBAction func linkButtonAction(_ sender: Any) {
        if let url = URL(string: "https://stresstojoy.com") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    @IBAction func exitButtonAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.showSuccessMessage(message: "Successfully logged out")
            let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = vc
        } catch  {
            self.showErrorWith(message: "Not able to logout")
        }
        
    }
}

extension DashboardViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dashboardCell", for: indexPath)
        let item = self.items[indexPath.row]
        if let imageView = cell.viewWithTag(10) as? UIImageView {
            imageView.image = item.1
        }
        if let label = cell.viewWithTag(11) as? UILabel {
            label.text = item.0
        }
        return cell
    }
    
}

extension DashboardViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProritiesViewController") {
                self.present(vc, animated: true, completion: nil)
            }
        case 1:
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "JournalViewController") as? JournalViewController {
                self.present(vc, animated: true, completion: nil)
            }
        case 2:
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "WellnessViewController") {
                self.present(vc, animated: true, completion: nil)
            }
        case 3:
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "MindfulViewController") {
                self.present(vc, animated: true, completion: nil)
            }
        case 4:
            if let url = URL(string: "https://drrozina.com") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
                }
            }
        default:
            break
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == (self.items.count - 1) {
            let size = CGSize(width: (collectionView.frame.width - 20 - 20), height: (collectionView.frame.width - 20 - 10)/3)
            return size
        }
        
        let size = CGSize(width: (collectionView.frame.width - 40 - 20)/2, height: (collectionView.frame.width - 20 - 10)/2)
        return size
    }
    
}
