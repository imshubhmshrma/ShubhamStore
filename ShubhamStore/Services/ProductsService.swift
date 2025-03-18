//
//  ProductsService.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 21/02/25.
//
import Foundation
import Combine
//std rss
class ProductsService {
    
 //  var cancellable = Set<AnyCancellable>()
  //  var products: [Product] = []
    
//    init() {
//        self.fetchProducts()
//    }
    
    //https://api.escuelajs.co/api/v1/products
    //"https://fakestoreapi.com/products"
    //https://dummyjson.com/products
    func fetchProducts() -> AnyPublisher<[Product], Error> {
        let apiURL = URL(string: "https://fakestoreapi.com/products")!
       return URLSession.shared.dataTaskPublisher(for: apiURL)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap{ (data, response) -> Data in
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    throw ApiError.invalidResponse
                }
                return data
            }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
 //           .receive(on: DispatchQueue.main)
//            .sink { receiveCompletion in
//                print(receiveCompletion)
//            } receiveValue: {[weak self] response in 
//                self?.products = response
//            }
//            .store(in: &cancellable)
    }
}
