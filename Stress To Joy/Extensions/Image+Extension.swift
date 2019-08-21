//
//  Image+Extension.swift
//  CBD Shops
//
//  Created by MacAir on 13/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImage {
    
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 0.5)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}



extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func removeImageColor(){
        let templateImage = self.image?.withRenderingMode(.alwaysOriginal)
        self.image = templateImage
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
    
    @IBInspectable
    var imageUrl: String {
        get {
            return ""
        }
        set {
            let url = URL(string: newValue)
            self.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "logo"))
        }
    }
    
}

