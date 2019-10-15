//
//  GuestRegisterVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class GuestRegisterVC: UIViewController {
    @IBOutlet weak var txtFullname: AppTextField!
    @IBOutlet weak var txtPhoneNumber: AppTextField!
    @IBOutlet weak var txtEmailAddress: AppTextField!
    @IBOutlet weak var txtTitle: AppTextField!
    @IBOutlet weak var txtSpeciality: AppTextField!
    @IBOutlet weak var txtNationality: AppTextField!
    @IBOutlet weak var txtPassword: AppTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPhoneNumber.keyboardType = .phonePad
        txtEmailAddress.keyboardType = .emailAddress
        txtPassword.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmailAddress.resignFirstResponder()
        txtFullname.resignFirstResponder()
        txtPhoneNumber.resignFirstResponder()
        txtTitle.resignFirstResponder()
        txtSpeciality.resignFirstResponder()
        txtNationality.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    @IBAction func register(_ sender: RoundedUIButton) {
    }
    
}
