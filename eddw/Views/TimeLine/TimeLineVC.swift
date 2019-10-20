//
//  TimeLineVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/20/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class TimeLineVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var timeTable: UITableView!
    private lazy var timeLines = [Timeline]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ServerOperations(view: view).retrieveTimeLine {[unowned self] (times) in
            self.timeLines = times
            print("Basem \(times.count)")
            
            self.timeTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeLineCell") as! TimeLineTableViewCell
        cell.setData(timeline: timeLines[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
