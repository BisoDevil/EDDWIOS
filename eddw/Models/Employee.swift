//
//  Employee.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import Foundation
struct Employee:Codable {
    var id: String = ""
    var fullname: String = ""
    var username: String = ""
    var companyId: Int = 0
    var company: Company = Company()
    var email: String = ""
    var phone: String = ""
    var title: Int = 0
    var speciality: String = ""
    var type: Int = 0
    var messageToken: String = ""
    var token: String = ""
}
struct Company:Codable {
    var name: String = ""
}
