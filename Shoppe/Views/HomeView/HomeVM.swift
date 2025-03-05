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
    var rur = 90.0
    var usd = 1.0
    var eur = 0.9
    
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
    
    let popularProducts = [Product(title: "Adidas", price: "32", imageUrl: "Lorem ipsum dolor sit amet consectetur.", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "23", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "89", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "40", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "")]
    
    let justForYouProducts = [Product(title: "Adidas", price: "31", imageUrl: "Lorem ipsum dolor sit amet consectetur.", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "14", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "42", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "56", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur.")]  // 4 product in figma
    
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
        case "Russia, Moscow": return price * 90
        case "England, Manchester": return price * 0.90
        default:
            return price
        }
    }
    
    func updateCurrency () async {
        let results = await HomeViewNetwork.homeViewNetwork.updateExchangeRate()
        
        rur = results?.data["RUB"]?.value ?? 90.0
//        usd = results?.data["USD"]?.value ?? 1.0
//        eur = results?.data["EUR"]?.value ?? 0.9
        
//        rur = data?.data["RUB"]?.value ?? 90
//        usd = data?.data["USD"]?.value ?? 1.0
//        eur = data?.data["EUR"]?.value ?? 0.9
        
    }
    
}
