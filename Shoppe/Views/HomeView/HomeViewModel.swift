//
//  HomeViewModel.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case clothing
    case shoes
    case bags
    case lingerie
    case accessories
    case watch
    case hoodies

    var id: String { rawValue }
    
    var imageName: String {
        switch self {
        case .clothing: return "clothing"
        case .shoes: return "shoes"
        case .bags: return "bags"
        case .lingerie: return "lingerie"
        case .accessories: return "accessories"
        case .watch: return "watch"
        case .hoodies: return "hoodies"
        }
    }
}

protocol HomeViewModelDelegate {
    var cartItemsCount: Int { get  set }
    var priceRegion: String { get }
    var adresses: [String] { get set }
    var chooseCategories: [Category] { get }
    var popularProducts: [Products] { get }
    var justForYouProducts: [Products] { get }
    var updateHandler: (([Products]) -> Void)? { get set }
    
    func getProduct()
    func addInCart(product: Products)
    func addToFavorite(product: Products)
    
    func priceTransform(price: Double, adres: String) -> Double //add MARAT
}

final class HomeViewModel: HomeViewModelDelegate {
    
    //Currency
    var rur = 90.0
    var usd = 1.0
    var eur = 0.90
    
    var updateHandler: (([Products]) -> Void)?
    var products: [Products]? = []
    var cartItemsCount = 0
    var userAdress = "Russia, Moscow"
    var chooseCategories: [Category] = [.clothing, .bags, .watch, .lingerie, .hoodies, .shoes]
    var adresses = ["Russia, Moscow", "USA, Las Vegas", "England, Manchester"]
    private var dataService: IProductService?
    private var networkingService: IHTTPClient?
    private var userDefaultsRepository: IUserDefaultsRepository?
    private var allProducts: [Products] = [] {
           didSet {
               updateHandler?(allProducts)
           }
       }
    private var selectedCategory: String? {
           didSet {
               userDefaultsRepository?.saveSelectedCategory(selectedCategory)
           }
       }
    //MARK: - Currency retrieval
    var priceRegion: String {
        switch userAdress {
        case "Russia, Moscow": return "RUB"
        case "England, Manchester": return "EUR"
        default: return "USD"
        }
    }
  //MARK: - Depedencies Injection
    init(_ dependencies: IDependencies){
        dataService = dependencies.myProductService
        networkingService = dependencies.networkService
        userDefaultsRepository = dependencies.userDefaultsRepository
        selectedCategory = userDefaultsRepository?.getSelectedCategory()
        
        updateCurrency() //add MARAT
        
    }
    // MARK: - Get Products
    func getProduct() {
           dataService?.getProducts { result in
               switch result {
               case .success(let products):
                   self.allProducts = products
                   self.updateUIWithProducts(products)
               case .failure(let error):
                   Log.error(error.localizedDescription)
               }
           }
       }
    
    func addInCart(product: Products){
//           dependencies.cartService.add(product: product)
        print("added to carts \(cartItemsCount) new products")
        cartItemsCount += 1
       }
       
       func addToFavorite(product: Products) {
//           dependencies.favoriteService.add(product: product)
       }
    
    var popularProducts: [Products] {
        allProducts.sorted { $0.price > $1.price }
    }

    var justForYouProducts: [Products] {
        allProducts.filter { product in
            userDefaultsRepository?.getFavoriteProducts().contains(product.id) ?? false
        }
    }
    
    func updateUIWithProducts(_ products: [Products]) {
         updateHandler?(products)
     }

    func priceTransform(price: Double, adres: String) -> Double {
            
            switch adres {
            case "Russia, Moscow": return price * rur
            case "England, Manchester": return price * eur
            default:
                return price
            }
        }
    
        //CURRENCY service
        func updateCurrency() {
            let currencyService = CurrencyService()
            ////ASYNC
//            let currencies = await currencyService.fetchCurrencies()
            
//            self.rur = currencies?.data.RUB.value ?? 1.0
//            self.usd = currencies?.data.USD.value ?? 1.0
//            self.eur = currencies?.data.EUR.value ?? 1.0
            
            
        currencyService.fetchCurrencies { result in
                switch result {
                case .success(let currencies):
                    self.rur = currencies.data.RUB.value
                    self.usd = currencies.data.USD.value
                    self.eur = currencies.data.EUR.value
                case .failure(let error):
                    print("currence func dont work - fail net operation")
                    print(error)
                }
            }
        }
    
//MARK: - COnvert URL to UIImage
    func loadImage(from product: Products, completion: @escaping (Image?) -> Void) {
        guard let imageURLString = product.image, let url = URL(string: imageURLString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(Image(uiImage: uiImage))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func selectCategory(_ category: Category) {
        selectedCategory = category.rawValue
    }
}


