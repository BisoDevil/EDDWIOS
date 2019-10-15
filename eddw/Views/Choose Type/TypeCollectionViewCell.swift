//
//  TypeCollectionViewCell.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        layer.shadowColor = UIColor(white: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5
        layer.masksToBounds = false
        clipsToBounds = true
       layer.cornerRadius = 15
    }
}
