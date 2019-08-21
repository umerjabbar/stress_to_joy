//
//  TableView+Extension.swift
//  CBD Shops
//
//  Created by MacAir on 15/07/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

extension UITableView {
    
    func addLabel(){
        if self.viewWithTag(100) == nil {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
            label.textAlignment = .center
            label.text = "No Items"
            label.tag = 100
            label.textAlignment = .center
            self.addSubview(label)
        }
    }
    
    func removeLabel(){
        if let label = self.viewWithTag(100) {
            label.removeFromSuperview()
        }
    }
    
}

extension UICollectionView {
    
    func addLabel(){
        if self.viewWithTag(100) == nil {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
            label.textAlignment = .center
            label.text = "No Items"
            label.tag = 100
            label.textAlignment = .center
            self.addSubview(label)
        }
    }
    
    func removeLabel(){
        if let label = self.viewWithTag(100) {
            label.removeFromSuperview()
        }
    }
    
}
