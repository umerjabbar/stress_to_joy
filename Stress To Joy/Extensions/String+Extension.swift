//
//  String+Extension.swift
//  CBD Shops
//
//  Created by MacAir on 05/07/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

extension String {
    
    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) -> NSMutableAttributedString{
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : 2.0,
//            NSAttributedString.Key.font : UIFont(name: "", size: 90) ?? UIFont.systemFont(ofSize: 90, weight: .bold)
            ] as [NSAttributedString.Key : Any]
        return NSMutableAttributedString(string: self, attributes: strokeTextAttributes)
    }
    
}
