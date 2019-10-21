//
//  DBOperations.swift
//  eddw
//
//  Created by Basem Abduallah on 10/21/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
import CoreData
class DBOperations {
    
    func saveNote(proId:Int,proName:String,note:String,callback:(_ saved:Bool)->Void) {
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
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "NotesDB")
        fetchRequest.predicate = NSPredicate(format: "proId == \(proId)")
        fetchRequest.fetchLimit = 1
        notes.setValue(proId, forKeyPath: "proId")
        notes.setValue(proName, forKeyPath: "proName")
        notes.setValue(note, forKeyPath: "note")
        do {
            let results = try managedContext.fetch(fetchRequest)
            let eNote = results.first?.value(forKeyPath: "note") as? String ?? ""
            if eNote != "" {
                results.first?.setValue(note, forKeyPath: "note")
            }
            
            
            try managedContext.save()
            callback(true)
        } catch let error as NSError {
            callback(false)
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getNote(proId:Int)->String {
        var note = ""
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return ""
        }
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "NotesDB")
        fetchRequest.predicate = NSPredicate(format: "proId == \(proId)")
        fetchRequest.fetchLimit = 1
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            note = results.first?.value(forKeyPath: "note") as? String ?? ""
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return note
    }
    
    func getAllNotes() -> [NSManagedObject] {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return [NSManagedObject]()
        }
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "NotesDB")
        
        
        do {
            let results = try managedContext.fetch(fetchRequest)            
            return results
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return [NSManagedObject]()
        }
    }
}
