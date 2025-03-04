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
    
    let popularProducts = [Product(title: "Adidas", price: "99", imageUrl: "Lorem ipsum dolor sit amet consectetur.", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "")]
    
    let justForYouProducts = [Product(title: "Adidas", price: "99", imageUrl: "Lorem ipsum dolor sit amet consectetur.", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur.")]  // 4 product in figma
   
    @Published var userAdress = "Russia, Moscow"
    @Published var searchText = ""
    
    func addInCart() {
        print("add in cart")
    }
    
    func addInFavorit() {
        print("add in favorit")
    }

    func priceTransform( price: Double) -> Double {
        
        switch userAdress {
        case "Russia, Moscow": return price * 90
        case "England, Manchester": return price * 0.90
        default:
           return price
        }
       
    }
    
}
