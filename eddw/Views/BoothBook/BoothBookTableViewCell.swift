//
//  BoothBookTableViewCell.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class BoothBookTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: RoundedImage!
    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
  
    func setData(booth:BoothBook) {
        title.text = booth.sponsor.name
        subTitle.text = booth.booth.name
    }

}
