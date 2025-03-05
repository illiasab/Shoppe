//
//  WishListView.swift
//  Shoppe
//
//  Created by Андрей Завадский on 05.03.2025.
//
import SwiftUI

struct WishListView: View {
    @State private var searchText: String = ""
    
    let products: [Product] = [
        Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt"),
        Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt"),
        Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt"),
        Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt")
    ]
    
    var body: some View {
            VStack {
                Text("WishList")
                    .applyFont(.raleway, .bold, 36)
                Spacer()
                HStack {
                    Text("Search")
                        .applyFont(.raleway, .bold, 16)
                        .foregroundColor(.gray)
                        .padding()
                    
                    HStack {
                        TextField("", text: $searchText)
                            .padding(5)
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                Spacer()
                                Spacer()
                            }
                        }
                        
                    }
                    .padding(5)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 2), spacing: 5) {
                        ForEach(products) { product in
                            CustomCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 10)
                }
                
                Spacer()
                
                BottomNavigationBar()
            }
            .navigationBarHidden(true)
    }
}

#Preview {
    WishListView()
}
