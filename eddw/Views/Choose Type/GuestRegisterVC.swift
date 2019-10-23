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
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func register(_ sender: RoundedUIButton) {
        var guest = Guest()
        guest.fullname = txtFullname.text!
        guest.phone = txtPhoneNumber.text!
        guest.email = txtEmailAddress.text!
        guest.title = 0
        guest.speciality = txtSpeciality.text!
        guest.country = txtNationality.text!
        guest.password = txtPassword.text!
        ServerOperations(view: view).registerGuest(guest: guest) {[unowned self] (logged) in
            if logged {
                self.performSegue(withIdentifier: "metaSegue", sender: nil )
            }else{
                self.view.makeToast("Try again")
            }
        }
    }
    
}
