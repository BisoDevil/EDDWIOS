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
    
    
    func retrieveProgramme(callback:@escaping (_ programms:[Programme])->Void) {
        dynamicRequest(url: "Programme") { (res:[Programme]?) in
            guard let progs = res else { return}
            callback(progs)
        }
    }
    
    
    
    fileprivate func dynamicRequest<T:Codable>(url:String,method:HTTPMethod = .get,body:T? = nil,query:Parameters? = nil,callback:@escaping (_ res:T?)->Void){
        
        view.makeToastActivity(.center)
        
        let header:HTTPHeaders? =  ["Authorization":"Bearer \(getToken())",
            "Content-Type":"application/json; charset=UTF-8"]
        guard var request = try? URLRequest(url: "\(baseURL)\(url)", method: method, headers: header) else { return  }
        let httpBody:Data? = try? JSONEncoder().encode(body)
        request.httpBody = httpBody
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