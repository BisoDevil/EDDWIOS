//
//  TimeLineTableViewCell.swift
//  eddw
//
//  Created by Basem Abduallah on 10/20/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    @IBOutlet weak var dateView: AppUIView!
    @IBOutlet weak var tvDate: UILabel!
    @IBOutlet weak var tvFromDateToDate: UILabel!
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateView.layer.borderWidth = 3
        dateView.layer.borderColor = UIColor.white.cgColor
    }
    func setData(timeline:Timeline){
        tvTitle.text = timeline.title
        tvDescription.text = timeline.information
        let start = timeline.startDate.toFormattedString(pattern: "hh:mm a")
        let end = timeline.endDate.toFormattedString(pattern: "hh:mm a")
        let day = timeline.startDate.toFormattedString(pattern: "dd\nMMM")
        tvFromDateToDate.text = "\(start)-\(end)"
        tvDate.text = day
    }
    
    
}
