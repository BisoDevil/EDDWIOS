//
//  SponsorVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class SponsorVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var sponsorTable: UITableView!
    
    var sponsors = [Sponsor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ServerOperations(view: view).retrieveSponsor { [unowned self] (all) in
            self.sponsors = all
            self.sponsorTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return sponsors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SponsorCell") as! SponsorTableViewCell
        cell.setData(sponsor: sponsors[indexPath.row])
        return cell
    }
    

}
