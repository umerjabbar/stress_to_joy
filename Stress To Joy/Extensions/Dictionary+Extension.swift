//
//  Dictionary+Extension.swift
//  CBD Shops
//
//  Created by MacAir on 16/07/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

extension Dictionary {
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        return output
    }
}

