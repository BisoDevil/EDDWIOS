//
//  SpeakerVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class SpeakerVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var allSpeakers = [Speaker]()
    
    @IBOutlet weak var speakerTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerOperations(view: view)
            .retrieveSpeaker {[unowned self] (speakers) in
                self.allSpeakers = speakers
                self.speakerTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSpeakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "speakerCell") as! SpeakerTableViewCell
//        cell.setData(speaker:allSpeakers[indexPath.row])
        cell.setData(speaker: allSpeakers[indexPath.row])
        return cell
    }
    
}
