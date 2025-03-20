//
//  CoreDataViewModel.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 18/03/25.
//

import SwiftUI

class CartViewModel : ObservableObject {
    
    // var coreDataManager : CoreDataManager!
    
    //    var productArr: [Product] {
    //        coreDataManager.fetchCartProducts()
    //    }
    
    @Published  var productArr: [Product] = []
    
    init() {
        self.productArr = PersistenceController.shared.fetchCartProducts()
    }
    
    func addToCart(product : Product, quantity: Int) {
        PersistenceController.shared.addToCart(product: product, quantity: quantity)
    }
    
    func emptyCart() {
        PersistenceController.shared.deleteAllCartProducts()
    }
    
    func deleteCartItem(product : Product) {
        let deleteStatus =  PersistenceController.shared.deleteCartItem(product: product)
        print("⚠️⚠️ deleteStatus == \(deleteStatus)")
        if deleteStatus == true{
            self.productArr =  PersistenceController.shared.fetchCartProducts()
        }
    }
    
}
