//
//  File.swift
//  CBD Shops
//
//  Created by MacAir on 28/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SwiftMessages

class Messages {
    
    class func showSuccessMessage(message:String?){
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        let messageView = MessageView.viewFromNib(layout: .cardView)
        messageView.configureTheme(.success)
        
        messageView.configureContent(title: "", body: message ?? "" )
        messageView.button?.isHidden = true
        SwiftMessages.show(config: config, view: messageView)
    }
    
    class func showParmenantSuccessMessage(message:String){
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.interactiveHide = false
        config.duration = .forever
        let messageView = MessageView.viewFromNib(layout: .cardView)
        let iconStyle:IconStyle = .default
        let iconImage = iconStyle.image(theme: .success)
        messageView.configureTheme(backgroundColor: Constants.AppColor, foregroundColor: .white, iconImage: iconImage)
        messageView.configureContent(title: "", body: message)
        messageView.button?.isHidden = true
        SwiftMessages.show(config: config, view: messageView)
        
    }
    
    class func showSuccessWithMessage(_ message:String, layout:MessageView.Layout) {
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.preferredStatusBarStyle = .lightContent
        let messageView = MessageView.viewFromNib(layout: layout)
        messageView.configureTheme(.success)
        messageView.configureContent(title: "", body: message)
        messageView.button?.isHidden = true
        SwiftMessages.show(config: config, view: messageView)
    }
    
    class func showErrorWith(message: String?){
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        let error = MessageView.viewFromNib(layout: .centeredView)
        error.configureContent(title: "Error", body: message ?? "Something went wrong")
        let iconStyle:IconStyle = .default
        let iconImage = iconStyle.image(theme: .error)
        error.configureTheme(backgroundColor: UIColor(named: "BC4C46") ?? #colorLiteral(red: 0.8959212303, green: 0.2223513722, blue: 0.2608771324, alpha: 1), foregroundColor: .white, iconImage: iconImage)
        error.button?.isHidden = true
        SwiftMessages.show(config: config, view: error)
    }
    
    class func showErrorBar(message: String?){
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        let error = MessageView.viewFromNib(layout: .statusLine)
        error.configureTheme(.error)
        error.configureContent(title: "", body: message ?? "Something went wrong")
        error.button?.isHidden = true
        SwiftMessages.show(config: config, view: error)
    }
    
}
