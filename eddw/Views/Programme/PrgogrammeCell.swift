//
//  PrgogrammeCell.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class PrgogrammeCell: UITableViewCell {
    @IBOutlet weak var speakerName: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var room: UILabel!
    private var isFavourtie = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   public func setCell(programme:Programme){
        title.text = programme.title
        room.text = programme.room.name
    date.text = "\(programme.startDate.toFormattedString(pattern: "hh:mm a")) - \(programme.endDate.toFormattedString(pattern: "hh:mm a"))"
        speakerName.text = programme.speaker.fullname
    }

    @IBAction func addToFavourite(_ sender: UIButton) {
        if isFavourtie {
            sender.setImage(#imageLiteral(resourceName: "fav_filled_button"), for: .normal)
        }else{
            sender.setImage(#imageLiteral(resourceName: "fav_button"), for: .normal)
        }
        isFavourtie = !isFavourtie
    }
}
