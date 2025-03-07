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
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                .foregroundStyle(.white)
                
            VStack(spacing: 5) {
                LazyVGrid (columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 0) {
                    ForEach(images, id: \.self) { item in
                        Image(item)
                            .resizable()
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                            .padding(5)
                    }
                }
                HStack {
                    Text(title)
                        .applyFont(.raleway,.bold,17)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 9)
                            .frame(width: 38, height: 20)
                            .foregroundStyle(.collectionCountBackground)
                        Text(count)
                            .applyFont(.raleway,.bold,12)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal,10)
                .padding(.bottom,10)
            }
        }
        .onTapGesture {
            print("go to products view ( product category: \(title)")
        }
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
                      action: { action() }, shimmer: false) 
            .padding(.horizontal,20)
        
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            
            ForEach(chooseCategories, id: \.self) { item in
                
                switch item {
                case .clothing : CategoryItems(images: clothing, title: "Clothing", count: "109")
                case .bags: CategoryItems(images: bags, title: "Bags", count: "42")
                case .watch: CategoryItems(images: watch, title: "Watch", count: "19")
                case .shoes: CategoryItems(images: shoes, title: "Shoes", count: "98")
                case .lingerie: CategoryItems(images: lingerie, title: "Lingerie", count: "69")
                case .hoodies: CategoryItems(images: hoodies, title: "Hoodies", count: "78")
                default: Text("OOOOoooppp's")
                }
                
            }
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    HomeCategoriesView(chooseCategories: [.clothing, .bags, .watch, .lingerie, .hoodies, .shoes], action: {})
}
