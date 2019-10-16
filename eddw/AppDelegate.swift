//
//  AppDelegate.swift
//  eddw
//
//  Created by Basem Abduallah on 10/14/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let logged = UserDefaults.standard.value(forKey: "token") as? String ?? ""        
        if logged.isEmpty{
            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }else{
            window?.rootViewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()
            
        }
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    
}

