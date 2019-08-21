//
//  Animate+Extension.swift
//  CBD Shops
//
//  Created by MacAir on 27/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


extension UIView {
    
    func shakeAnimation() {
        
        self.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
        
        //        guard let view = self as? SpringView else{return}
        //
        //        view.animation = "shake"
        //        view.curve = "spring"
        //        view.duration = 0.2
        //        view.force = 0.4
        //        view.delay = 0.0
        //        view.animate()
        
    }
    
    func shake() {
        self.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    func bounce(){
        UIView.animate(withDuration: 0.6, animations: {
            self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.transform = CGAffineTransform.identity
            }
        })
    }
    
   
    
}


