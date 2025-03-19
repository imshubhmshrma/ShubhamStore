//
//  CoreDataViewModel.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 18/03/25.
//

import SwiftUI

class CartViewModel : ObservableObject {
    
    var coreDataManager : CoreDataManager!
    
//    var productArr: [Product] {
//        coreDataManager.fetchCartProducts()
//    }
    
   @Published var productArr: [Product] = []
    
    init() {
        self.coreDataManager = CoreDataManager()
        self.productArr = coreDataManager.fetchCartProducts()
    }
    
    func addToCart(product : Product, quantity: Int) {
        self.coreDataManager.addToCart(product: product, quantity: quantity)
    }
    
    func emptyCart() {
        self.coreDataManager.deleteAllCartProducts()
    }
    
    func deleteCartItem(product : Product) {
       let deleteStatus = self.coreDataManager.deleteCartItem(product: product)
        print("⚠️⚠️ deleteStatus == \(deleteStatus)")
        if deleteStatus == true{
            self.productArr = coreDataManager.fetchCartProducts()
        }
    }
    
}
