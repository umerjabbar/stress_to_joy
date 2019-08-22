//
//  User.swift
//  Stress To Joy
//
//  Created by Umer Jabbar on 22/08/2019.
//  Copyright © 2019 Syed  Rafay. All rights reserved.
//

import Foundation
import SwiftyJSON


class User : NSObject, NSCoding{
    
    var address : String!
    var email : String!
    var fName : String!
    var id : String!
    var lName : String!
    var password : String!
    var phone : String!
    var username : String!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        address = json["address"].stringValue
        email = json["email"].stringValue
        fName = json["f_name"].stringValue
        id = json["id"].stringValue
        lName = json["l_name"].stringValue
        password = json["password"].stringValue
        phone = json["phone"].stringValue
        username = json["username"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        let dictionary = [String:Any]()
        if address != nil{
            dictionary["address"] = address
        }
        if email != nil{
            dictionary["email"] = email
        }
        if fName != nil{
            dictionary["f_name"] = fName
        }
        if id != nil{
            dictionary["id"] = id
        }
        if lName != nil{
            dictionary["l_name"] = lName
        }
        if password != nil{
            dictionary["password"] = password
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if username != nil{
            dictionary["username"] = username
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        address = aDecoder.decodeObject(forKey: "address") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        fName = aDecoder.decodeObject(forKey: "f_name") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        lName = aDecoder.decodeObject(forKey: "l_name") as? String
        password = aDecoder.decodeObject(forKey: "password") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        username = aDecoder.decodeObject(forKey: "username") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if fName != nil{
            aCoder.encode(fName, forKey: "f_name")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if lName != nil{
            aCoder.encode(lName, forKey: "l_name")
        }
        if password != nil{
            aCoder.encode(password, forKey: "password")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if username != nil{
            aCoder.encode(username, forKey: "username")
        }
        
    }
    
}
