//
//  MainTabBarController.swift
//  TrailHop
//
//  Created by MobiWhiz on 5/3/19.
//  Copyright © 2019 MobiWhiz. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    @IBOutlet weak var myTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.myTabBar.barTintColor = .black
        self.selectedViewController = self.viewControllers?[1]
        self.myTabBar.backgroundColor = UIColor.clear
        myTabBar.backgroundImage = UIImage()
        myTabBar.shadowImage = UIImage()
    
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
