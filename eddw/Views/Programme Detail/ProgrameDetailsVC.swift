//
//  ProgrameDetailsVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/20/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
import CoreData
class ProgrameDetailsVC: UITableViewController {
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvTitleData: UILabel!
    @IBOutlet weak var tvDate: UILabel!
    @IBOutlet weak var tvDateData: UILabel!
    @IBOutlet weak var tvSpeaker: UILabel!
    @IBOutlet weak var tvSpeakerData: UILabel!
    @IBOutlet weak var tvLocation: UILabel!
    @IBOutlet weak var tvLocationData: UILabel!
    @IBOutlet weak var tvInformation: UILabel!
    @IBOutlet weak var tvInformationData: UILabel!
    @IBOutlet weak var tvAttendance: UILabel!
    @IBOutlet weak var txtAttendanceCode: AppTextField!
    @IBOutlet weak var tvNote: UILabel!
    @IBOutlet weak var txtNote: AppTextField!
    
    public lazy var id = 0
    private lazy var programme = Programme()
    override func viewDidLoad() {
        super.viewDidLoad()
        programme = ProgrammeVC.allProgrammes.first(where: {$0.id == id})!
        setupUI()
        tvTitleData.text = programme.title
        let from = programme.startDate.toFormattedString(pattern: "MMM d, HH:mm a")
        let to = programme.endDate.toFormattedString(pattern: "HH:mm a")
        tvDateData.text = "\(from)-\(to)"
        tvSpeakerData.text = programme.speaker.fullname
        tvLocationData.text = programme.room.name
        tvInformationData.text = programme.description        
        
    }
    
    @IBAction func sendAttendanceCode(_ sender: RoundedUIButton) {
      ServerOperations(view: view).saveAttendance(code: txtAttendanceCode.text!, programmeId: programme.id)
    }
    
    @IBAction func saveNote(_ sender: RoundedUIButton) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "NotesDB",
                                       in: managedContext)!
        
        let notes = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        
        // 3
        notes.setValue(programme.id, forKeyPath: "proId")
        notes.setValue(programme.title, forKey: "proName")
        notes.setValue(txtNote.text!, forKey: "note")
        // 4
        do {
            try managedContext.save()
          view.makeToast("Saved")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    private func setupUI(){
        let radius:CGFloat = 15
        tvTitle.roundCorners(corners: [.topLeft,.topRight], radius: radius)
        tvDate.roundCorners(corners: [.topLeft,.topRight], radius: radius)
        tvSpeaker.roundCorners(corners: [.topLeft,.topRight], radius: radius)
        tvLocation.roundCorners(corners: [.topLeft,.topRight], radius: radius)
        tvInformation.roundCorners(corners: [.topLeft,.topRight], radius: radius)
        tvAttendance.roundCorners(corners: [.topLeft,.topRight], radius: radius)
        tvNote.roundCorners(corners: [.topLeft,.topRight], radius: radius)
    }
    
}
