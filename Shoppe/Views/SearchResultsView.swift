//
//  SearchView.swift
//  Shoppe
//
//  Created by Андрей Завадский on 03.03.2025.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let imageName: String
}

struct SearchResultsView: View {
    @State private var searchText: String = ""
    
    let products: [Product] = [
        Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt"),
        Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt"),
        Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt"),
        Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Shop")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    
                    HStack {
                        TextField("Search", text: $searchText)
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
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                        ForEach(products) { product in
                            CustomCardView(product: product)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                BottomNavigationBar()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SearchResultsView()
}
