//
//  CoreDataManager.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 11/03/25.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistantContainer : NSPersistentContainer
    
    init() {
        self.persistantContainer = NSPersistentContainer(name: "Cart")
        self.persistantContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Failed to initialize  \(error.localizedDescription)")
            }
        }
    }
    
    
    func addToCart(product : Product) {
        print("Product to save to cart 👉🏻 ",product)
        let cartProduct = CartProduct(context: persistantContainer.viewContext)
        cartProduct.name = product.title
        do {
            try persistantContainer.viewContext.save()
            print("Product Saved to cart")
        } catch(let error) {
            fatalError("Core Data Error saving product \(product) Error :- \(error.localizedDescription)")
        }
    }
    
    
    func fetchCartProducts() -> [Product] {
        let fetchRequest : NSFetchRequest<CartProduct> = CartProduct.fetchRequest()
        var productsToReturn: [Product]  = []
        do {
          let cProduct =  try persistantContainer.viewContext.fetch(fetchRequest)
           _ = cProduct.map { product in
               let product =  Product(id: 0, title: product.name, price: 0.00, description: "", category: Category(rawValue: ""), image: "", rating: Rating(rate: 1.3, count: 3))
               productsToReturn.append(product)
            }
            return productsToReturn
        } catch {
            return []
        }
    }
}
