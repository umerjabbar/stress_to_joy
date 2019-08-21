//
//  Button+Extension.swift
//  CoachOnTheGo
//
//  Created by MacAir on 20/07/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
//import MaterialComponents

extension UIButton {
    
    func addRipple(){
//        let rippleTouchController = MDCRippleTouchController()
//        rippleTouchController.addRipple(to: self)
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
        self.setImage(templateImage, for: .normal)
        self.tintColor = color
    }
    
    func removeImageColor(){
        let templateImage = self.image(for: .normal)?.withRenderingMode(.alwaysOriginal)
        self.setImage(templateImage, for: .normal)
    }
    
    @IBInspectable
    var imageColor: UIColor? {
        get {
            if let color = self.tintColor {
                return UIColor(cgColor: color.cgColor)
            }
            return nil
        }
        set {
            if let color = newValue {
                self.setImageColor(color: color)
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    //    @IBInspectable
    //    var imageUrl: String {
    //        get {
    //            return ""
    //        }
    //        set {
    //            let url = URL(string: newValue)
    //            self.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder-profile-sq"))
    //        }
    //    }
    
    
}
