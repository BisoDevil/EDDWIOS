//
//  AppTextField.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
@IBDesignable
class AppTextField: SkyFloatingLabelTextField {
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        lineHeight = 1
        selectedLineHeight = 1
        selectedLineColor = UIColor(named: "MainColor") ?? .green
        selectedTitleColor = UIColor(named: "MainColor") ?? .green
        textColor = UIColor(named: "TextColor") ?? UIColor.darkGray
        placeholderColor = UIColor(named: "TextColor") ?? .darkGray
        titleColor = UIColor(named: "TextColor") ?? UIColor.darkGray
        
    }
    
    
}
