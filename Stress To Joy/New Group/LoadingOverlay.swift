//
//  LoadingOverlay.swift
//  CBD Shops
//
//  Created by MacAir on 28/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

public class LoadingOverlay{
    
    let loadingView:UIView = {
        let loadingView = UIView(frame: CGRect(origin: .zero, size: UIScreen.main.bounds.size))
        loadingView.backgroundColor = UIColor.black
        loadingView.alpha = 0.6
        return loadingView
    }()
    
    let activityIndicatorSize:CGFloat = 60.0
    
    lazy var activityIndicator:NVActivityIndicatorView = {
        let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: (UIScreen.main.bounds.width/2)-(activityIndicatorSize/2), y: (UIScreen.main.bounds.height/2)-(activityIndicatorSize/2), width: activityIndicatorSize, height: activityIndicatorSize), type: NVActivityIndicatorType.ballClipRotatePulse, color: UIColor.white, padding: 0)
        self.loadingView.addSubview(activityIndicator)
        return activityIndicator
    }()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay() {
        let window = (UIApplication.shared.delegate)?.window
        activityIndicator.startAnimating()
        window??.addSubview(loadingView);
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        loadingView.removeFromSuperview()
    }
}
