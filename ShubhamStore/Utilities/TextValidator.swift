//
//  TextValidator.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 18/02/25.
//

import Foundation


struct ValidatorStatusNMessage {
    let status: Bool
    let message: String
}

struct Validator {
    static func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
 
    static func isValidPassword(_ password: String) -> ValidatorStatusNMessage {
        if password.count <= 4 {
            return ValidatorStatusNMessage(status: false , message: "Password must be at least 4 characters long.")
        } else {
            return ValidatorStatusNMessage(status: true , message: "")
        }
    }
}

