//
//  BaseNavigationController.swift
//  CoachOnTheGo
//
//  Created by MacAir on 19/07/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Hero

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationBar.setBackgroundImage(UIImage()
        self.navigationBar.shadowImage = UIImage()
//        self.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        self.navigationBar.isTranslucent = false
//        self.navigationBar.clipsToBounds = false
        self.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationBar.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        
        self.hero.isEnabled = true
        
        self.changeTransitionAnimation(isAuto: true)
    }
    
    func changeTransitionAnimation(isAuto : Bool = false){
        if isAuto {
            self.hero.navigationAnimationType = .auto
        }else{
            self.hero.navigationAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .uncover(direction: .down))
        }
    }
    

}
