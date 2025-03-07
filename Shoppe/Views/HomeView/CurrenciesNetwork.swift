//
//  CurrenciesNetwork.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 07.03.2025.
//

import Foundation

struct CurrencyResponse: Codable {
    let data: Currency
}

struct Currency: Codable {
    let RUB: OneCurrency
    let USD: OneCurrency
    let EUR: OneCurrency
}

struct OneCurrency: Codable {
    let code: String
    let value: Double
}

class CurrencyService {
    
    private let apiURL = "https://api.currencyapi.com/v3/latest?apikey=cur_live_ueEAFUkiPHBbXIuJ2DnpmaQDjHYSh2Sg8LKmLg54"
    
//    //ASYNC
//    func fetchCurrencies() async -> CurrencyResponse? {
//        
//        guard let url = URL(string: apiURL) else { return nil}
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let currencies = try JSONDecoder().decode(CurrencyResponse.self, from: data)
//            return currencies
//        } catch {
//            print("Download error")
//        }
//        return nil
//    }
    
    func fetchCurrencies(completion: @escaping (Result<CurrencyResponse, Error>) -> Void) {

        guard let url = URL(string: apiURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("have error")
                return
            }

            guard let data = data else { print("no data")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(CurrencyResponse.self, from: data)
                print(decodedData)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                completion(.failure(error))
                print(data)
            }
        }.resume()
    }
}
