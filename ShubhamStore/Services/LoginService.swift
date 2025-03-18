//
//  LoginService.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 18/02/25.
//
import Foundation
import Combine

class LoginService{
    
    let apiURLStr = "https://dummyjson.com/auth/login"
    
    var cancellables = Set<AnyCancellable>()
    static let shared = LoginService()
    
    private init() { }
    
    func hitLoginApi(_ email: String, _ password: String, completion: @escaping ((LoginResponseModel) -> Void) ){
        let parameter: [String : Any]  = [
            "username" : "emilys",//email,
            "password" : "emilyspass"//password
        ] 
        let url = URL(string : apiURLStr)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: parameter,options:[])
        
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                (200..<300).contains(response.statusCode)  else {
                    throw ApiError.failedRequest
                }
                return data
            }
            .decode(type: LoginResponseModel.self,decoder: JSONDecoder())
            .sink(receiveCompletion: { result in
                print(result)
                switch(result) {
                case .failure(let error) :
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                completion(response)
            })
            .store(in: &cancellables)
    }
}
