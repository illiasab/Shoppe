//
//  HomeViewNetwork.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 04.03.2025.
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
    
    //ASYNC
    func fetchCurrencies() async -> CurrencyResponse? {
        
        guard let url = URL(string: apiURL) else { return nil}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let currencies = try JSONDecoder().decode(CurrencyResponse.self, from: data)
            return currencies
        } catch {
            print("Download error")
        }
        return nil
    }
    
//    func fetchCurrencies(completion: @escaping (Result<CurrencyResponse, Error>) -> Void) {
//       
//        guard let url = URL(string: apiURL) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                print("have error")
//                return
//            }
//            
//            guard let data = data else { print("no data")
//                return
//            }
//            
//            do {
//                let decodedData = try JSONDecoder().decode(CurrencyResponse.self, from: data)
//                print(decodedData)
//                DispatchQueue.main.async {
//                    completion(.success(decodedData))
//                }
//            } catch {
//                completion(.failure(error))
//                print(data)
//            }
//        }.resume()
//    }
    
}















//struct CurrencyResponse: Decodable {
//    let meta: Meta
//    let data: [String: Currency]
//}

//
//struct Test: Codable {
//    let EUR: Currency
//    let RUB: Currency
//    let USD: Currency
//}
//
//struct EUR: Codable {
//    let EUR: Currency
//}
//
//struct RUB: Codable {
//    let RUB: Currency
//}
//struct USD: Codable {
//    let USD: Currency
//}

//struct Meta: Codable {
//    let lastUpdatedAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case lastUpdatedAt = "last_updated_at"
//    }
//}
//
//struct Currency: Codable {
//    let code: String
//    let value: Double
//}
//
//
//class HomeViewNetwork {
//    
//    let apiKey = "cur_live_ueEAFUkiPHBbXIuJ2DnpmaQDjHYSh2Sg8LKmLg54" // 300 / mounth
//    let url = "https://app.currencyapi.com/v3/latest?apikey="
//    
//    static let homeViewNetwork = HomeViewNetwork()
//    
//    private init() {}
//    
//    func updateExchangeRate() async -> CurrencyResponse? {
//        
////        var urlComponents = URLComponents(string: "https://app.currencyapi.com/v3/latest?apikey=cur_live_ueEAFUkiPHBbXIuJ2DnpmaQDjHYSh2Sg8LKmLg54")
//        
////        guard let url = urlComponents?.url else { print("no url");return nil }
//        
//        guard let url = URL(string: url+apiKey) else { return nil}
//        let reqest = URLRequest(url: url)
//        
//        
//        URLSession.shared.dataTask(with: reqest) { data,_,error in
//            
//            guard error == nil else { print("network error"); return}
//            
//            guard let data else {print("no data network error");return}
//            
//            guard let response = try? JSONDecoder().decode(CurrencyResponse.self, from: data) else { return }
//            print(response)
//            
//        }
//        return nil
//    }
//}
            
    //        guard let url = URL(string:"https://app.currencyapi.com/v3/latest?") else { print("don work url"); return nil}
            
//        do {
//            let (data,response) = try await URLSession.shared.data(from: url)
//            print(data)
//            print(response)
//            let result = try JSONDecoder().decode(CurrencyResponse.self, from: data)
//            return result
//        }catch {
//            print(error.localizedDescription)
//        }
    

