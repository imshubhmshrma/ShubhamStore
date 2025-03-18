//
//  LoginViewModel.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 19/02/25.
//

import SwiftUI

class LoginViewModel : ObservableObject{
         
    func loginApi(_ email : String,
                  _ password: String,
                  completion: @escaping (LoginResponseModel) -> Void) {
            LoginService.shared.hitLoginApi("", "", completion: { response in
                completion(response)
            })
    }
    
}
