//
//  SpeakerLoginVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class SpeakerLoginVC: UIViewController {
    
    @IBOutlet weak var txtUsername: AppTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(_ sender: Any) {
        ServerOperations(view: view)
            .loginSpeaker(username: txtUsername.text!) {[unowned self] (logged) in
                if logged {
                    self.performSegue(withIdentifier: "homeSegue", sender: nil)
                }else{
                    self.view.makeToast("Wrong username")
                }
        }
    }
    
    
    
}
