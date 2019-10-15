//
//  CompanyLoginVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class CompanyLoginVC: UIViewController {
    @IBOutlet weak var txtUsername: AppTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(_ sender: RoundedUIButton) {
        ServerOperations(view: view)
            .loginEmployee(username: txtUsername.text!) {[unowned self] (logged) in
                if logged
                {
                    self.performSegue(withIdentifier: "homeSegue", sender: nil)
                }else{
                    self.view.makeToast("Wrong Username")
                }
        }
    }
    
}
