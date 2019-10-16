//
//  SponsorTableViewCell.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class SponsorTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: RoundedImage!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    func setData(sponsor:Sponsor) {
        title.text = sponsor.name
        subTitle.text = sponsor.inforamtion
        cellImage.moa.errorImage = #imageLiteral(resourceName: "sponsor")
        cellImage.moa.url = sponsor.logo
    }

}
