//
//  ProgrammeVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/16/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class ProgrammeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   public var hands = "Scentific" //HandsOn
    //    var hands = "HandsOn"
    static public var allProgrammes = [Programme]()
    private lazy var programs = [Programme]()
    fileprivate  lazy var id = 0
    @IBOutlet weak var programmeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerOperations(view: view)
            .retrieveProgramme {[unowned self] (data) in
                ProgrammeVC.allProgrammes = data
                print("Basem type \(self.hands)")
                self.programs = data.filter({$0.type == self.hands})
                self.programmeTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programmeCell") as! PrgogrammeCell
        cell.setCell(programme: programs[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = programs[indexPath.row].id
        performSegue(withIdentifier: "detailsSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let dets = segue.destination as! ProgrameDetailsVC
            dets.id = id
        }
    }
}
