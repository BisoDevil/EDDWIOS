//
//  NotesVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/21/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class NotesVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let notes = DBOperations().getAllNotes()
    var id = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "note")
        cell.selectionStyle = .none
        cell.textLabel?.text = notes[indexPath.row].value(forKeyPath: "proName") as? String ?? ""
        cell.detailTextLabel?.text = notes[indexPath.row].value(forKeyPath: "note") as? String ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = notes[indexPath.row].value(forKeyPath: "proId") as? Int ?? 0
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let dets = segue.destination as! ProgrameDetailsVC
            dets.id = id
        }
    }
}
