//
//  MetaVC.swift
//  eddw
//
//  Created by Basem Abduallah on 10/23/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit
import CalendarDateRangePickerViewController
class MetaVC: UIViewController ,CalendarDateRangePickerViewControllerDelegate{
    
    
    @IBOutlet weak var metaAssistQuestion: UISegmentedControl!
    @IBOutlet weak var roomType: UISegmentedControl!
    private var operation:ServerOperations?
    @IBOutlet weak var transportation: UISegmentedControl!
    
    var meta = MetaAssist()
    var startDate = ""
    var endDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operation = ServerOperations(view: view)
    }
    
    @IBAction func saveMetaAssist(_ sender: Any) {
        meta.accoStartDate = startDate
        meta.accoEndDate = endDate
        meta.isTransportation = transportation.selectedSegmentIndex == 0
        meta.room = roomType.selectedSegmentIndex
        operation?.saveMetaAssist(meta: meta, callback: {[unowned self] (it) in
            if it == nil {
                self.view.makeToast("Saved")
            }else{
                self.view.makeToast("Something went wrong")
            }
        })
    }
    
    @IBAction func accomodationChanges(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            let dateRangePickerViewController = CalendarDateRangePickerViewController(collectionViewLayout: UICollectionViewFlowLayout())
            dateRangePickerViewController.delegate = self
            let navigationController = UINavigationController(rootViewController: dateRangePickerViewController)
            self.navigationController?.present(navigationController, animated: true, completion: nil)
        }
    }
    func didTapCancel() {
        
    }
    
    func didTapDoneWithDateRange(startDate: Date!, endDate: Date!) {
        self.startDate = startDate.toServerFormat()
        self.endDate = endDate.toServerFormat()
    }
}
