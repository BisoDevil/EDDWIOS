//
//  StringExtension.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import Foundation
extension String{
    
    func toFormattedString(pattern:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = pattern
        let formated = dateFormatter.string(from: date)
        return formated
    }
   
}
