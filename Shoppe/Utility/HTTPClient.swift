//
//  HTTPClient.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//

import Moya
import Foundation

typealias HTTPResult = Result<Data, Error>
protocol IHTTPClient {
    func request(target: ShoppeEndpoint , completion: @escaping (HTTPResult) -> Void)
}

struct HTTPClient: IHTTPClient {
    private let provider = MoyaProvider<ShoppeEndpoint>()
    func request(target: ShoppeEndpoint, completion: @escaping (HTTPResult) -> Void) {
        provider.request(target) { result in
            var returnedResult: HTTPResult
            defer {
                completion(returnedResult)
            }
            switch result {
            case let .success(response):
                do {
                    let url = URL(target: target)
                    let data = try response.handle(url: url)
                    returnedResult = .success(data)
                } catch let error {
                    returnedResult = .failure(error)
                }
            case let .failure(error):
                returnedResult = .failure(error)
            }
        }
    }
}
