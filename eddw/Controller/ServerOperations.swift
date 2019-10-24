//
//  ServerOperations.swift
//  eddw
//
//  Created by Basem Abduallah on 10/15/19.
//  Copyright © 2019 innovationcodes. All rights reserved.
//

import Foundation
import Alamofire
import Toast_Swift
import UIKit

class ServerOperations {
    fileprivate let view:UIView
    fileprivate let baseURL="http://eddw.innovationcodes.com/api/"
    fileprivate let shared = UserDefaults.standard
    init(view:UIView) {
        self.view = view
    }
    
    func isLogged() -> Bool {
        let logged = shared.value(forKey: "token") as? String ?? ""
        return logged.isEmpty
    }
    func logout()-> Bool{
        let dictionary = shared.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            if key != "messageToken" {
                shared.removeObject(forKey: key)
            }
            
        }
        shared.synchronize()
        return true
    }
    private func getToken()-> String{
        return shared.value(forKey: "token") as? String ?? ""
    }
    
    private func getClientId()-> String{
        return shared.value(forKey: "id") as? String ?? ""
    }
    
    func loginSpeaker(username:String,callback:@escaping(_ logged: Bool)->Void) {
        dynamicRequest(url: "Speaker/Authenticate/\(username)") {[unowned self] (speak:Speaker?) in
            guard let speaker = speak else {
                callback(false)
                return}
            self.shared.set(speaker.fullname, forKey: "name")
            self.shared.set(speaker.token, forKey: "token")
            self.shared.set(speaker.username, forKey: "username")
            self.shared.set(speaker.id, forKey: "username")
            self.shared.synchronize()
            
            self.view.makeToast("Welcome , \(speaker.fullname)")
            callback(true)
        }
    }
    func loginEmployee(username:String,callback:@escaping(_ logged: Bool)->Void) {
        dynamicRequest(url: "Employee/Authenticate/\(username)") {[unowned self] (employee:Employee?) in
            guard let employee = employee else {
                callback(false)
                return}
            self.shared.set(employee.fullname, forKey: "name")
            self.shared.set(employee.token, forKey: "token")
            self.shared.set(employee.username, forKey: "username")
            self.shared.set(employee.id, forKey: "username")
            self.shared.synchronize()
            self.view.makeToast("Welcome , \(employee.fullname)")
            callback(true)
        }
    }
    
    func loginGuest(username:String,password:String,callback:@escaping(_ logged: Bool)->Void) {
        dynamicRequest(url: "Guest/Authenticate/\(username)/\(password)") {[unowned self] (guest:Guest?) in
            guard let guest = guest else {
                callback(false)
                return}
            self.shared.set(guest.fullname, forKey: "name")
            self.shared.set(guest.accessToken, forKey: "token")
            self.shared.set(guest.username, forKey: "username")
            self.shared.set(guest.id, forKey: "username")
            self.shared.synchronize()
            self.view.makeToast("Welcome , \(guest.fullname)")
            callback(true)
        }
    }
    
    func registerGuest(guest:Guest,callback:@escaping(_ logged: Bool)->Void) {
        dynamicRequest(url: "Guest",method: .post,body: guest) {[unowned self] (guest:Guest?) in
            guard let guest = guest else {
                callback(false)
                return}
            self.shared.set(guest.fullname, forKey: "name")
            self.shared.set(guest.accessToken, forKey: "token")
            self.shared.set(guest.username, forKey: "username")
            self.shared.set(guest.id, forKey: "username")
            self.shared.synchronize()
            self.view.makeToast("Welcome , \(guest.fullname)")
            callback(true)
        }
    }
    
    
    func retrieveProgramme(callback:@escaping (_ programms:[Programme])->Void) {
        dynamicRequest(url: "Programme") { (res:[Programme]?) in
            guard let progs = res else { return}
            callback(progs)
        }
    }
    func retrieveSpeaker(callback:@escaping (_ programms:[Speaker])->Void) {
        dynamicRequest(url: "speaker") { (res:[Speaker]?) in
            guard let progs = res else { return}
            callback(progs)
        }
    }
    func retrieveSponsor(callback:@escaping (_ programms:[Sponsor])->Void) {
        dynamicRequest(url: "sponsor") { (res:[Sponsor]?) in
            guard let progs = res else { return}
            callback(progs)
        }
    }
    
    //BoothBooks
    func retrieveBoothBook(callback:@escaping (_ programms:[BoothBook])->Void) {
        dynamicRequest(url: "BoothBooks") { (res:[BoothBook]?) in
            guard let progs = res else { return}
            callback(progs)
        }
    }
    
    // timelines
    func retrieveTimeLine(callback:@escaping (_ times:[Timeline])->Void) {
        dynamicRequest(url: "Timeline/\(getClientId())") { (res:[Timeline]?) in
            guard let time = res else {return}
            callback(time)
        }
    }
    
    //save attendance
    func saveAttendance(code:String,programmeId:Int){
        var attendance = Attendance()
        attendance.programmeId = programmeId
        attendance.userId = getClientId()
        
        dynamicRequest(url: "Attendance/\(code)", method: .post, body: attendance) {[unowned self] (res:Attendance?) in
            if res == nil {
                self.view.makeToast("wrong attendance code")
                
            }else{
                self.view.makeToast("Saved")
            }
        }
    }
    
    
    func saveMetaAssist(meta:MetaAssist,callback:@escaping (_ met:MetaAssist?)->Void) {
        var me = meta
        me.user = getClientId()
        dynamicRequest(url: "MetaAssist", method: .post, body: me) {(res:MetaAssist?) in
            
            callback(res)
            
        }
    }
    
    fileprivate func dynamicRequest<T:Codable>(url:String,method:HTTPMethod = .get,body:T? = nil,query:Parameters? = nil,callback:@escaping (_ res:T?)->Void){
        
        view.makeToastActivity(.center)
        
        let header:HTTPHeaders? =  ["Authorization":"Bearer \(getToken())",
            "Content-Type":"application/json; charset=UTF-8"]
        guard var request = try? URLRequest(url: "\(baseURL)\(url)", method: method, headers: header) else { return  }
        let httpBody:Data? = try? JSONEncoder().encode(body)
        if method != .get{
            request.httpBody = httpBody ?? nil
        }
        
        Alamofire.request(request).responseJSON { (response) in
            self.view.hideToastActivity()
            response.result.ifFailure {
                print("Basem log: error network \(String(describing: response.error?.localizedDescription))")
                return
            }
            response.result.ifSuccess {
                guard let serverResponse = try? JSONDecoder().decode(T.self, from: response.data!) else{
                    let log = String(data: response.data!, encoding: .utf8) ?? "error"
                    print("Basem log:\(log)")
                    return}
                callback(serverResponse)
            }
            
        }
    }
}
