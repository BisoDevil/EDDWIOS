//
//  RoundedImage.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedImage: UIImageView {
    
    @IBInspectable
    open var isSelected:Bool = false{
        didSet{
            if isSelected {
                layer.borderWidth = 5
            }else{
                layer.borderWidth = 0
            }
            
        }
    }
    
    
    @IBInspectable
    open var rounded:Bool = false{
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable
    open var cornerRadius:CGFloat = 0{
        didSet{
            layoutSubviews()
            
        }
    }
    
    @IBInspectable
    open var shadow:Bool = false{
        didSet{
            layoutSubviews()
        }
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        clipsToBounds = true
        if rounded {
            bounds.size.height = frame.height
            bounds.size.width = frame.height
            layer.cornerRadius = bounds.height / 2
        }else{
            layer.cornerRadius = cornerRadius
        }
        if shadow {
            layer.shadowColor = UIColor(white: 0, alpha: 0.25).cgColor
            layer.shadowOffset = CGSize(width: 2, height: 2)
            layer.shadowOpacity = 0.5
            layer.shadowRadius = 5
            layer.masksToBounds = false
            clipsToBounds = false
            
        }
        
        layer.borderColor = UIColor(named: "MainColor")?.cgColor ?? UIColor.green.cgColor
        
        
    }
    
}
