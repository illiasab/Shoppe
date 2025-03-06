//
//  CartsService.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/5/25.
//
import Foundation

typealias CartResult = Result<[Carts], Error>
protocol ICartService {
    func getProducts(completion: @escaping (CartResult) -> Void)
}

struct CartService: ICartService {
    private let networkService: IHTTPClient
    
    init(_ dependencies: IDependencies) {
        networkService = dependencies.networkService
    }
    func getProducts(completion: @escaping (Result<[Carts], Error>) -> Void)  {
        downloadCarts(completion: completion)
    }
}

extension CartService {
    private func downloadCarts(completion: @escaping (CartResult) -> Void) {
        networkService.request(target: .products) { result in
            var returnedResult: CartResult
            defer {
                OperationQueue.mainAsyncIfNeeded {
                    completion(returnedResult)
                }
            }
            switch result {
            case .success(let data):
                do {
                    let model = try data.decoded() as [Carts]
                    returnedResult = .success(model)
                } catch let error {
                    returnedResult = .failure(error)
                }
            case .failure(let error):
                returnedResult = .failure(error)
            }
        }
    }
}

extension CartService {
    private func addToCarts(completion: @escaping (CartResult) -> Void) {
        
    }
}
