//
//  HomeViewController.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
import Auk
class HomeViewController: UIViewController {
    @IBOutlet weak var imageSlidder: UIScrollView!
    @IBOutlet weak var btnHands: UIButton!
    
    @IBOutlet weak var btnProgramme: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerOperations(view: view)
            .retrieveProgramme {(data) in
                ProgrammeVC.allProgrammes = data
                
                
        }
        imageSlidder.auk.show(url: "https://www.companieshistory.com/wp-content/uploads/2015/01/Novartis.jpg")
        imageSlidder.auk.show(url:  "https://colombiareports.com/wp-content/uploads/2019/08/pfizer-1170x585.jpg")
        imageSlidder.auk.show(url: "https://wazayf4u.com/wp-content/uploads/2017/10/download-2_600x300.jpg")
        imageSlidder.auk.startAutoScroll(delaySeconds: 3)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ProgrammeVC{
            print("Basem go to programme controller")
            switch (sender as! UIButton) {
            case btnHands:
                destination.hands = "HandsOn"
                break
            case btnProgramme:
                destination.hands = "Scentific"
                break
                
            default:
                print("else")
            }
        }
        
    }
}
