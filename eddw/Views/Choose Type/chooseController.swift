//
//  ViewController.swift
//  eddw
//
//  Created by Basem Abduallah on 10/14/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

class chooseController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var container: UIView!
    
    private let types = [#imageLiteral(resourceName: "speaker"),#imageLiteral(resourceName: "company"),#imageLiteral(resourceName: "guest")]
    private let names = ["Speaker","Company's Doctor","Guest"]
    
        private lazy var speaker: SpeakerLoginVC = {
            // Load Storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
            // Instantiate View Controller
            var viewController = storyboard.instantiateViewController(withIdentifier: String(describing: SpeakerLoginVC.self)) as! SpeakerLoginVC
    
            return viewController
        }()
    private lazy var company: CompanyLoginVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: String(describing: CompanyLoginVC.self)) as! CompanyLoginVC
        
        return viewController
    }()
    private lazy var guest: GuestLoginVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: String(describing: GuestLoginVC.self)) as! GuestLoginVC
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeCell", for: indexPath) as! TypeCollectionViewCell
        
        cell.image.image = types[indexPath.row]
        cell.title.text = names[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.transition(with: cell!, duration: 0.3, options: [.transitionFlipFromLeft], animations: nil)
        UIView.transition(with: txtTitle, duration: 0.3, options: [.transitionFlipFromBottom], animations: {
            self.txtTitle.text = "I am a \(self.names[indexPath.row])"
        })
        switch indexPath.row {
        case 0:
            embed(asChildViewController: speaker, containr: container)
            break
        case 1:
            embed(asChildViewController: company, containr: container)
            break
        case 2:
            embed(asChildViewController: guest, containr: container)
            break
        default:
            print(indexPath.row)
        }
    }
}


