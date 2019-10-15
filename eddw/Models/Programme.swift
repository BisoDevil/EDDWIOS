//
//  Programme.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import Foundation
struct Programme:Codable {
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var startDate: String = ""
    var endDate: String = ""
    var speaker: Speaker = Speaker()
    var attendanceCode: String = ""
    var room: Room = Room()
    var status = ""
    var type = ""
}
