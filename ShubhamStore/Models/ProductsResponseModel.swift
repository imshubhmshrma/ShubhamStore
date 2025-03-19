//
//  ProductsResponseModel.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 21/02/25.
//

struct Product: Codable, Identifiable, Hashable {
    
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: Category?
    let image: String?
    let rating: Rating?
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable, Hashable {
    let rate: Double?
    let count: Int?
}
