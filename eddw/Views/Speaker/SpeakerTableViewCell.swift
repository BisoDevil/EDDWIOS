//
//  SpeakerTableViewCell.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class SpeakerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: RoundedImage!
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var title: UILabel!
    func setData(speaker:Speaker) {
        title.text = speaker.fullname
        subtitle.text = speaker.country
        cellImage.moa.url = "https://i.ytimg.com/vi/_G1ho0bFnXc/hqdefault.jpg"
    }
    
}
