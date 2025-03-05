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

class HomeViewModelMock: ObservableObject {
    
    var priceRegion: String {
        switch userAdress {
        case "Russia, Moscow": return "RUR"
        case "England, Manchester": return "EUR"
        default: return "USD"
        }
    }
    
    var cartItemsCount = 2
    var chooseCategories: [Category] = [.clothing, .bags, .watch, .lingerie, .hoodies, .shoes]
    let adresses = ["Russia, Moscow", "USA, Las Vegas", "England, Manchester"] //"Salatiga City, Central Java""/
    
    let popularProducts = [ProductMock(title: "Adidas", price: "99", imageUrl: "Lorem ipsum dolor sit amet consectetur.", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "")]
    
    let justForYouProducts = [ProductMock(title: "Adidas", price: "99", imageUrl: "Lorem ipsum dolor sit amet consectetur.", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur.")]  // 4 product in figma
   
    @Published var userAdress = "Russia, Moscow"
    @Published var searchText = ""
    
    func addInCart() {
        print("add in cart")
    }
    
    func addInFavorit() {
        print("add in favorit")
    }

    
}
