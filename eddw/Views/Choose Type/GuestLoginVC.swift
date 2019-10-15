//
//  GuestLoginVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class GuestLoginVC: UIViewController {
    @IBOutlet weak var txtUsername: AppTextField!
    @IBOutlet weak var txtPassword: AppTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
txtPassword.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: RoundedUIButton) {
    }
    
}
