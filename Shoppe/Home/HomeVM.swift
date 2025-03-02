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
    
    var cartItemsCount = 2 
    var chooseCategories: [Category] = [.clothing, .bags, .watch, .lingerie, .hoodies, .shoes]
    let adresses = ["Salatiga City, Central Java", "Russia, Moscow", "USA, Las Vegas", "Mexico, El Paso"]
    let popularProducts = [Product(title: "Adidas", price: "99", imageUrl: "", description: ""), Product(title: "Adidas", price: "99", imageUrl: "", description: ""), Product(title: "Adidas", price: "99", imageUrl: "", description: ""), Product(title: "Adidas", price: "99", imageUrl: "", description: ""), Product(title: "Adidas", price: "99", imageUrl: "", description: "")]
    @Published var userAdress = "Salatiga City, Central Java"
    @Published var searchText = ""
    

    
}
