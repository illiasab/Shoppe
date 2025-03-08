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
        GeometryReader{ geometry in
            VStack(spacing: 10){
                Text("WishList")
                    .applyFont(.raleway, .bold, 28)
                    HStack {
                        HStack{
                            TextField("Search", text: $searchText)
                                .padding(5)
                            
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                    
                                    
                                }
                            }
                           
                        }
                        .padding(5)
                        .frame(width:geometry.size.width
                               * 0.7, height: 36)
                        .background(Color(.systemGray6))
                        .cornerRadius(18)
                        Spacer()
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
                
//                BottomNavigationBar()
            }
        }
    }
}

#Preview {
    WishListView()
}
