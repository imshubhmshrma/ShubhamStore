//
//  CoreDataManager.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 11/03/25.
//

import Foundation
import CoreData
 
class PersistenceController : ObservableObject {
    
   let persistantContainer = NSPersistentContainer(name: "Cart")
    
   static let shared = PersistenceController()
     
    
   private init() {
        self.persistantContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data Failed to initialize  \(error.localizedDescription)")
               // fatalError("Core Data Failed to initialize  \(error.localizedDescription)")
            }
        }
    }
    
    
    func addToCart(product : Product, quantity : Int) {
        print("Product to save to cart 👉🏻 ",product)
        let cartProduct = CartProduct(context: persistantContainer.viewContext)
        cartProduct.id = String(product.id!)
        cartProduct.name = product.title
        cartProduct.image = product.image
        cartProduct.price = product.price!
        cartProduct.quantity = String(quantity)
        
        
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
               let product =  Product(id: Int(product.id!), title: product.name, price: product.price, description: product.description, category: Category(rawValue: ""), image: "", rating: Rating(rate: 0.0, count: 0))
               productsToReturn.append(product)
            }
            return productsToReturn
        } catch {
            return []
        }
    }
    
    
    func deleteAllCartProducts() {
        print("deleteAllCartProducts ")
        let fetchRequest : NSFetchRequest<CartProduct> = CartProduct.fetchRequest()
        guard let cProduct =  try? persistantContainer.viewContext.fetch(fetchRequest) else { return }
        
        // List of multiple objects to delete
        let objects: [NSManagedObject] = cProduct// A list of objects

        // Get a reference to a managed object context
        let context = persistantContainer.viewContext

        // Delete multiple objects
        for object in objects {
            context.delete(object)
        }

        // Save the deletions to the persistent store
        try? context.save()
    }
    
    func deleteCartItem(product : Product) -> Bool {
        print("id is ",product)
        guard let productItem = getItemBy(id: String(product.id!)) else { return false }
        
        persistantContainer.viewContext.delete(productItem)
        try? persistantContainer.viewContext.save()
        
        return true
    }
 
    private func getItemBy(id: String) -> CartProduct? {

           let fetchRequest : NSFetchRequest<CartProduct> = CartProduct.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "id == %@", id)

           do {
               let productItem = try persistantContainer.viewContext.fetch(fetchRequest).first

               return productItem

           } catch let error {
               debugPrint(error)
           }

           return nil
       }
}
 
