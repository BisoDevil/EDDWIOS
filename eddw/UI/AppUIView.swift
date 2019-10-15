//
//  AppUIView.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
@IBDesignable
class AppUIView: UIView {
    @IBInspectable
    open var shadow:Bool = false{
        didSet{
            if shadow {
                layer.shadowColor = UIColor(white: 0, alpha: 0.25).cgColor
                layer.shadowOffset = CGSize(width: 2, height: 2)
                layer.shadowOpacity = 0.5
                layer.shadowRadius = 5
                layer.masksToBounds = false
                clipsToBounds = false
            }
            
        }
    }
    @IBInspectable
    open var cornerRadius:CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            
        }
    }

}
