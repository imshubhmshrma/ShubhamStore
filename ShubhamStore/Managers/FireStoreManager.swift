//
//  FireStoreManager.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 08/04/25.
//

// FirestoreManager.swift

import Foundation
import Firebase

class FirestoreManager: ObservableObject {

 //   static let shared = FirestoreManager()
    private var db = Firestore.firestore()
    
   // private init() {}
    
    func addToCart(product: Product, quantity: Int) {
        guard let productId = product.id else { return }
        let docRef = db.collection("Cart").document(String(productId))
          
        docRef.setData(["productId": productId,
                        "quantity": quantity]) { error in
            if let error = error {
                print("Error while adding product to Cart: \(error)")
            } else {
                print("Product added to Cart successfully!")
            }
        }
    }
}
