//
//  ProfileViewController.swift
//  Stress To Joy
//
//  Created by Syed  Rafay on 19/07/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }

    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageContainer.softCorner(self.imageContainer.frame.height/2)
        profileImg.softCorner(self.profileImg.frame.height/2)
        // Do any additional setup after loading the view.
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
