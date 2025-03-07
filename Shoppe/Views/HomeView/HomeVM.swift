//
//  HomeVM.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 02.03.2025.
//

import Foundation

enum Category {
    case clothing
    case shoes
    case bags
    case lingerie
    case accessories
    case watch
    case hoodies
}

class HomeViewModel: ObservableObject {
    
    //Currency
    var rur = 91.0
    var usd = 1.0
    var eur = 0.85
    
    var priceRegion: String {
        switch userAdress {
        case "Russia, Moscow": return "RUR"
        case "England, Manchester": return "EUR"
        default: return "USD"
        }
    }
    
    var cartItemsCount = 2
    var chooseCategories: [Category] = [.clothing, .bags, .watch, .lingerie, .hoodies, .shoes]
    let adresses = ["Russia, Moscow", "USA, Las Vegas", "England, Manchester"]
    
    var popularProducts = [Product(title: "Adidas", price: "32", imageUrl: "Lorem ipsum dolor sit amet consectetur.", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "23", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "89", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "40", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "")]
    
    var justForYouProducts = [Product(title: "Adidas", price: "31", imageUrl: "Lorem ipsum dolor sit amet consectetur.", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "14", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "42", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "56", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur.")]  // 4 product in figma
    
    var popular = [Product]()
    var just = [Product]()
    
    @Published var userAdress = "Russia, Moscow"
    @Published var searchText = ""
    
    func addInCart() {
        print("add in cart")
    }
    
    func addInFavorit() {
        print("add in favorit")
    }
    
    func priceTransform(price: String) -> Double {
        guard let price = Double(price) else { return 0.0 }
        
        switch userAdress {
        case "Russia, Moscow": return price * rur
        case "England, Manchester": return price * eur
        default:
            return price
        }
    }
    
    func updateCurrency() async {
        let currencyService = CurrencyService()
        
        let currencies = await currencyService.fetchCurrencies()
        
        self.rur = currencies?.data.RUB.value ?? 1.0
        self.usd = currencies?.data.USD.value ?? 1.0
        self.eur = currencies?.data.EUR.value ?? 1.0
        
        
        
//    currencyService.fetchCurrencies { result in
//            switch result {
//            case .success(let currencies):
//                self.rur = currencies.data.RUB.value
//                self.usd = currencies.data.USD.value
//                self.eur = currencies.data.EUR.value
//                
//            case .failure(let error):
//                print("currence func dont work - fail net operation")
//                print(error)
//            }
//        }
    }
    
}
