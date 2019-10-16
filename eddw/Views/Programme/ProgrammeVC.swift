//
//  ProgrammeVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class ProgrammeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var hands = "Scentific" //HandsOn
    //    var hands = "HandsOn"
    var allProgrammes = [Programme]()
    
    @IBOutlet weak var programmeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerOperations(view: view)
            .retrieveProgramme {[unowned self] (data) in
                self.allProgrammes = data.filter({$0.type == self.hands})
                self.programmeTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProgrammes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programmeCell") as! PrgogrammeCell
        cell.setCell(programme: allProgrammes[indexPath.row])
        return cell
    }
    
}
