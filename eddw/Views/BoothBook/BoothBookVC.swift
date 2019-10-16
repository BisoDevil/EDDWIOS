//
//  BoothBookVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class BoothBookVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var boothTable: UITableView!
    var boothes = [BoothBook]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerOperations(view: view).retrieveBoothBook { [unowned self](boothes) in
            self.boothes = boothes
            self.boothTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boothes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boothBookCell") as! BoothBookTableViewCell
        cell.setData(booth: boothes[indexPath.row])
        return cell
    }
    
}
