//
//  ProductService.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/5/25.
//
import Foundation

typealias ProductResult = Result<[Products], Error>
protocol IProductService {
    func getProducts(completion: @escaping (ProductResult) -> Void)
}

struct ProductService: IProductService {
    private let networkService: IHTTPClient
    
    init(_ dependencies: IDependencies) {
        networkService = dependencies.networkService
    }
    func getProducts(completion: @escaping (Result<[Products], Error>) -> Void)  {
        downloadProducts(completion: completion)
    }
}

//MARK: - Private
extension ProductService {
    private func downloadProducts(completion: @escaping (ProductResult) -> Void) {
        networkService.request(target: .products) { result in
            var returnedResult: ProductResult
            defer {
                OperationQueue.mainAsyncIfNeeded {
                    completion(returnedResult)
                }
            }
            switch result {
            case .success(let data):
                do {
                    let model = try data.decoded() as [Products]
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
