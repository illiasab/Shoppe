//
//  HomeViewModel.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

protocol HomeViewModelDelegate {
    var updateHandler: (([Products]) -> Void)? { get set }
    func getProduct()
}
final class HomeViewModel: HomeViewModelDelegate {
    var updateHandler: (([Products]) -> Void)?
    private var dataService: IProductService?
    private var networkingService: IHTTPClient?
    private var userDefaultsRepository: IUserDefaultsRepository?
    private var products: [Products]?
    private var selectedCategory: String? {
           didSet {
               userDefaultsRepository?.saveSelectedCategory(selectedCategory)
           }
       }
    
    init(_ dependencies: IDependencies) {
        dataService = dependencies.myProductService
        networkingService = dependencies.networkService
        userDefaultsRepository = dependencies.userDefaultsRepository
        selectedCategory = userDefaultsRepository?.getSelectedCategory()
    }
    // MARK: - userDefaults save category container
 
    
    func getProduct() {
        dataService?.getProducts(completion: { result in
            switch result {
            case .success(let products):
                self.products = products
                self.updateHandler?(products)
            case .failure(let error):
                Log.error(error.localizedDescription)
            }
        })
    }
    
    func loadImage(from product: Products, completion: @escaping (Image?) -> Void) {
         guard let imageURLString = product.image, let url = URL(string: imageURLString) else {
             completion(nil)
             return
         }
         
         DispatchQueue.global().async { [weak self] in
             if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
                 DispatchQueue.main.async {
                     completion(Image(uiImage: uiImage))
                 }
             } else {
                 DispatchQueue.main.async {
                     completion(nil)
                 }
             }
         }
     }
    
    func selectCategory(_ category: String) {
           selectedCategory = category
    }
}


