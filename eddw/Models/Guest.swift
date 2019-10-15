//
//  Guest.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import Foundation
struct Guest:Codable {
    var id: String? = nil
    var fullname: String = ""
    var username: String = ""
    var email: String = ""
    var phone: String = ""
    var title: Int = 0
    var speciality: String = ""
    var country: String = ""
    var password: String = ""
    var accessToken: String? = ""
}
