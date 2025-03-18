//
//  ProductsViewModel.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 21/02/25.
//

import SwiftUI
import Combine


class ProductsViewModel : ObservableObject{
    
    private var productService = ProductsService()
    @Published var products : [Product] = []
    var cancellable = Set<AnyCancellable>()
    
    func getProducts() {
        productService.fetchProducts()
            .receive(on: DispatchQueue.main)
            .sink { data in
                // print(data)
            } receiveValue: { response in
                self.products = response
            }
            .store(in:&cancellable)
    }
    
}
