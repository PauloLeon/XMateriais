//
//  Defaults.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class Defaults {
    
    static let userSessionKey = "com.save.usersession"
    static let sessionCustomer = "com.save.customer"
            
    static func saveTypeUser(type: Int) {
        UserDefaults.standard.set(type, forKey: userSessionKey)
    }
    
    static func getTypeUser() -> Int {
        return UserDefaults.standard.integer(forKey: userSessionKey)
    }
        
    static func clearUserData(){
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
    
    static func clearAll() {
        UserDefaults.standard.removeObject(forKey: userSessionKey)
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
        }
    }
}
