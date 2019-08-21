//
//  HomeViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 19/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit

class HomeViewController: DrawableViewController {

    @IBOutlet weak var overLay_one: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var overLay_two: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.softCorner(10)
        view2.softCorner(10)
        view3.softCorner(10)
        view4.softCorner(10)
        
        self.navBarTitle = "Home"
        self.setNavigationBarCenterTitle(titleFlag: true, showImage: false)

        let Tap = UITapGestureRecognizer(target: self, action: #selector(toPriorities))
        self.view1.isUserInteractionEnabled = true
        self.view1.addGestureRecognizer(Tap)

        
        let Tap1 = UITapGestureRecognizer(target: self, action: #selector(toPriorities))
        self.view2.isUserInteractionEnabled = true
        self.view2.addGestureRecognizer(Tap1)
        
        
        let Tap2 = UITapGestureRecognizer(target: self, action: #selector(toPriorities))
        self.view3.isUserInteractionEnabled = true
        self.view3.addGestureRecognizer(Tap2)
        
        
        let Tap3 = UITapGestureRecognizer(target: self, action: #selector(toThreeWord))
        self.view4.isUserInteractionEnabled = true
        self.view4.addGestureRecognizer(Tap3)
        
//        overLay_one.softCorner(10)
//        overLay_two.softCorner(10)
//        overLay_one.dropShadow(color: .lightGray, opacity: 0.4, offSet: CGSize(width: 0, height: 0), radius: 1, scale: true)
//        overLay_two.dropShadow(color: .lightGray, opacity: 0.4, offSet: CGSize(width: 0, height: 0), radius: 1, scale: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func toPriorities(){
        performSegue(withIdentifier: "toPriorities", sender: nil)
    }
    @objc func toThreeWord(){
        performSegue(withIdentifier: "toThreeword", sender: nil)
    }
    @objc func toWellness(){
        
    }
    @objc func toMindful(){
        
    }

    @IBAction func blogPressed(_ sender: Any) {
        if let url = URL(string: "https://drrozina.com") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    @IBAction func stressToJoy(_ sender: Any) {
        if let url = URL(string: "https://stresstojoy.com") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
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
