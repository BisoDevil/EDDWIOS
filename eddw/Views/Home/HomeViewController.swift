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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSlidder.auk.show(url: "https://www.companieshistory.com/wp-content/uploads/2015/01/Novartis.jpg")
        imageSlidder.auk.show(url:  "https://colombiareports.com/wp-content/uploads/2019/08/pfizer-1170x585.jpg")
        imageSlidder.auk.show(url:      "https://wazayf4u.com/wp-content/uploads/2017/10/download-2_600x300.jpg")
        imageSlidder.auk.startAutoScroll(delaySeconds: 3)
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
