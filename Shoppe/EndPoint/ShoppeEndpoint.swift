//
//  ShoppeEndpoint.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//

import Foundation
import Moya

enum ShoppeEndpoint {
    case products
    case productsByid(id: Int)
    case carts
    case cartsByid(id: Int)
    case users
    case usersByid(id: Int)
    case auth
    
}

extension ShoppeEndpoint: TargetType {
    var baseURL: URL {
        guard let url = URL(string: API.baseUrl) else { fatalError() }
        return url
    }
    var path: String {
        switch self {
        case .products: return "products"
        case .productsByid(id: let id):
            return "products/\(id)"
        case .carts: return "carts"
        case .cartsByid(id: let id):
            return "carts/\(id)"
        case .users: return "users"
        case .usersByid(id: let id):
           return "users/\(id)"
        case .auth: return "login"
        }
    }
    
    var method: Moya.Method {
          switch self {
          case .products, .carts, .users: return .get
          case .productsByid, .cartsByid, .usersByid: return .get
          case .auth: return .post
          }
      }
    
    var task: Task {
           switch self {
           case .products, .productsByid, .carts, .cartsByid, .users, .usersByid:
               return .requestPlain
           case .auth:
               let parameters: [String: Any] = ["username": "test_user", "password": "test_password"]
               return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
           }
       }
        var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var additionalMethod: Moya.Method? {
            switch self {
            case .products, .carts, .users: return .post
            case .productsByid, .cartsByid, .usersByid: return .put
            default: return nil
            }
        }
        
        var deleteMethod: Moya.Method? {
            switch self {
            case .productsByid, .cartsByid, .usersByid: return .delete
            default: return nil
            }
        }
}
