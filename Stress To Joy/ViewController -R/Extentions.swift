//
//  Extensions.swift
//  Mind Alert
//
//  Created by MobiWhiz on 6/12/19.
//  Copyright © 2019 MobiWhiz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func softCorner(_ radius: CGFloat){
        self.layer.cornerRadius = radius
    }
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}

extension StringProtocol  {
    var digits: [Int] {
        return compactMap{ $0.wholeNumberValue }
    }
}
extension LosslessStringConvertible {
    var string: String { return String(self) }
}
extension Int {
    var digits: [Int] {
        return string.digits
    }
}

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}
extension UIViewController{
    
    func alertMessage(message: String, title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension UIView {
    
    //    // OUTPUT 1
    //    func dropShadow(scale: Bool = true) {
    //        layer.masksToBounds = false
    //        layer.shadowColor = UIColor.black.cgColor
    //        layer.shadowOpacity = 0.5
    //        layer.shadowOffset = CGSize(width: -1, height: 1)
    //        layer.shadowRadius = 1
    //
    //        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    //        layer.shouldRasterize = true
    //        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    //    }
    
    // OUTPUT 2
    func dropShadow2(color: UIColor, scale: Bool) {
        //        let path = UIBezierPath(rect: CGRect(x: -5.0 / 2, y: -5.0 / 2,width: self.frame.size.width + 5,height: self.frame.size.height + 5))
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.05
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 10.0
        
        
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadow2(color: UIColor, scale: Bool, radius: CGFloat) {
        //        let path = UIBezierPath(rect: CGRect(x: -5.0 / 2, y: -5.0 / 2,width: self.frame.size.width + 5,height: self.frame.size.height + 5))
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.05
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = radius
        
        
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}


func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}


class MySlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var result = super.trackRect(forBounds: bounds)
        result.origin.x = 0
        result.size.width = bounds.size.width
        result.size.height = 1 //added height for desired effect
        return result
    }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        return super.thumbRect(forBounds:
            bounds, trackRect: rect, value: value)
            .offsetBy(dx: 0, dy: 0)
    }
    
}

var isBankList = false
var isCashOut = false
var isAddBalance = false
var message = ""
var isFirstTime = false
var indexPa = 0
var isFromorders = false

var isFirstOnChat = true
var isACustomer = false
var isFromPush = false
var screen_Name = ""
extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension UIButton{
  
}



extension String {
    
    public var localizedString : String{
        return NSLocalizedString(self, comment: "")
    }
    
    
    func englishNumbers() -> String? {
        let oldCount = self.count
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = Locale(identifier: "EN")
        
        if let final = formatter.number(from: self) {
            let newCount = "\(final)".count
            let differ = oldCount - newCount
            if differ == 0 {
                return "\(final)"
            } else {
                var outFinal = "\(final)"
                for _ in 1...differ {
                    outFinal = "0" + outFinal
                }
                return outFinal
            }
        } else {
            return nil
        }
    }
    
    func arabicNumbers() -> String? {
        let oldCount = self.count
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ar")
        
        if let final = formatter.number(from: self) {
            let newCount = "\(final)".count
            let differ = oldCount - newCount
            if differ == 0 {
                return "\(final)"
            } else {
                var outFinal = "\(final)"
                for _ in 1...differ {
                    outFinal = "0" + outFinal
                }
                return outFinal
            }
        } else {
            return nil
        }
    }
    
    public var toEnglishNumbers: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    
    public var toArabicNumbers: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $1, with: $0) }
        return str
    }
    
    public var localizedNumber : String{
        
        if "en".localizedString == "ar" {
            return self.toArabicNumbers
        }else {
            return self.toEnglishNumbers
        }
        
    }
    
    public func format(to : String = "dd/MM/yyyy", from : String = "yyyy-MM-dd HH:mm:ss") -> String{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = from
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = to
        if let date = dateFormatterGet.date(from: self){
            return dateFormatterPrint.string(from: date)
        }
        else {
            return "n/a"
        }
    }
    
    public func getDate(from : String = "yyyy-MM-dd HH:mm:ss") -> Date{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = from
        if let date = dateFormatterGet.date(from: self){
            return date
        }else{
            return Date()
        }
    }
    
}


// make a phone call
extension String {
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }
    
    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeAColl() {
        if isValid(regex: .phone) {
            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
