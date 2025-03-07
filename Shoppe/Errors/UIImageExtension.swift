//
//  UIImageExtension.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/7/25.
//

import Moya
import SwiftUI

//extension UIImage {
//    static func load(from product: Products, provider: MoyaProvider<ShoppeEndpoint>, completion: @escaping (UIImage?) -> Void) {
//        guard let imageURLString = product.image else {
//            completion(nil)
//            return
//        }
//        
//        provider.request(.fetchImage(url: imageURLString)) { result in
//            switch result {
//            case .success(let response):
//                if let image = UIImage(data: response.data) {
//                    DispatchQueue.main.async {
//                        completion(image)
//                    }
//                } else {
//                    DispatchQueue.main.async {
//                        completion(nil)
//                    }
//                }
//            case .failure:
//                DispatchQueue.main.async {
//                    completion(nil)
//                }
//            }
//        }
//    }
//}
