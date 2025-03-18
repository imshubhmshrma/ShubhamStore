//
//  LoginResponseModel.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 18/02/25.
//


struct LoginResponseModel: Codable, Identifiable {
    let id: Int?
    let username, email, firstName, lastName: String?
    let gender: String?
    let image: String?
}
