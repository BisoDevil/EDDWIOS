//
//  ViewController.swift
//  eddw
//
//  Created by Basem Abduallah on 10/14/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
extension UIViewController{
    func embed(asChildViewController viewController: UIViewController,containr view:UIView) {
        viewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        viewController.view.frame = view.bounds
        addChild(viewController)        
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.layer.add(transition, forKey: nil)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

}

