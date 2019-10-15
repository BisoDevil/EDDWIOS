//
//  RoundedUIButton.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedUIButton: UIButton {

    @IBInspectable
    var backgourndTintColor:UIColor = UIColor(named: "MainColor") ?? .green{
        didSet{
            layer.backgroundColor = backgourndTintColor.cgColor
        }
    }
      // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // Shadow and Radius
        layer.shadowColor = UIColor(white: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
        layer.masksToBounds = false
        clipsToBounds = false
        layer.cornerRadius = frame.height / 2
        layer.backgroundColor = backgourndTintColor.cgColor
        
    }

}
