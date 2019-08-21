//
//  Int+Exrtension.swift
//  CoachOnTheGo
//
//  Created by MacAir on 17/07/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

extension Int {
    
    func makeStar() -> NSMutableAttributedString{
        let rate = self
        let string = NSMutableAttributedString()
        for i in 1...5 {
            let attachment = NSTextAttachment()
            if i > rate {
                attachment.image = #imageLiteral(resourceName: "unrate")
            }else{
                attachment.image = #imageLiteral(resourceName: "rate")
            }
            
            attachment.bounds = CGRect(x: 0, y: -5, width: 12, height: 12)
            let attributed = NSAttributedString(attachment: attachment)
            string.append(attributed)
        }
        return string
    }
    
}
