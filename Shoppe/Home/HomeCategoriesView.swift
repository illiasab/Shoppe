//
//  HomeCategoriesView.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 02.03.2025.
//

import SwiftUI

struct CategoryItems: View {
    let images: [String]
    let title: String
    let count: String
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 9)
                .shadow(radius: 5)
                .foregroundStyle(.white)
                
            VStack {
                LazyVGrid(columns: [GridItem(.fixed(70)), GridItem(.fixed(70))]) {
                    ForEach(images, id: \.self) { item in
                        Image(item)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                    }
                }
                HStack {
                    Text(title)
                        .font(.system(size: 17)) // rale 17 med
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 9)
                            .frame(width: 38, height: 20)
                            .foregroundStyle(.cyan)             // Color
                        Text(count)
                            .foregroundStyle(.black)
                            .font(.system(size: 12))// rale 12
                    }
                }
                .padding(.horizontal,10)
            }
        }
        .frame(width: 165, height: 192)
    }
}

struct HomeCategoriesView: View {
    let chooseCategories: [Category]
    let action: ()-> Void
    
    let clothing = ["clot1", "clot2", "clot3", "clot4"]
    let shoes = ["shoe1", "shoe2", "shoe3", "shoe4"]
    let bags = ["bag1", "bag2", "bag3", "bag4"]
    let lingerie = ["lin1", "lin2", "lin3", "lin4"]
    let watch = ["watch1", "watch2", "watch3", "watch4"]
    let hoodies = ["hoodi1", "hoodi2", "hoodi3", "hoodi4"]
    
    var body: some View {
        
        ScrollButtons(title: "Categories",
                      button: true,
                      action: { action() }) 
            .padding(.horizontal,20)
        
        LazyVGrid(columns: [GridItem(.fixed(180)), GridItem(.fixed(180))], spacing: 20) {
            ForEach(chooseCategories, id: \.self) { item in
                
                switch item {
                case .clothing : CategoryItems(images: clothing, title: "Clothing", count: "109")
                case .bags: CategoryItems(images: bags, title: "Bags", count: "123")
                case .watch: CategoryItems(images: watch, title: "Watch", count: "19")
                case .shoes: CategoryItems(images: shoes, title: "Shoes", count: "98")
                case .lingerie: CategoryItems(images: lingerie, title: "Lingerie", count: "65")
                case .hoodies: CategoryItems(images: hoodies, title: "Hoodies", count: "78")
                default: Text("OOOOoooppp's")
                }
                
            }
        }
    }
}

#Preview {
    HomeCategoriesView(chooseCategories: [.clothing, .bags, .watch, .lingerie, .hoodies, .shoes], action: {})
}
