//
//  UserSessionManagement.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 20/02/25.
//
import Foundation

struct UserSessionManagement {
    
    static let shared = UserSessionManagement()
    private init() { }
    
    func userLoggedIn() {
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
    }
    
    func userLoggedOut() {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
    }
    
    
    func userLoginInStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    }
}
