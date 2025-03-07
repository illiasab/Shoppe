//
//  HomeView.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 02.03.2025.
//

import SwiftUI

struct HomeView: View {
    var viewModel: HomeViewModelDelegate?
    @State private var products: [Products] = []
    @State private var searchText: String = ""
    @State private var userAdress = "Russia, Moscow"

    init(viewModel: HomeViewModelDelegate?) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HomeToolbar(userAdress: $userAdress,
                    adresses: viewModel?.adresses ?? [],
                        cartItemsCount: viewModel?.cartItemsCount ?? 2)
        
            HomeSearchView(searchText: $searchText)
        
        ScrollView(showsIndicators: false) {
                
            HomeCategoriesView(chooseCategories: viewModel?.chooseCategories ?? [.bags],
                                   action: {print("go to all categoriesView")})
                
            if !products.isEmpty {
                                PopularProducts(priceRegion: viewModel?.priceRegion ?? "",
                                                products: products,
                                                action: { print("go to popularView") })
                            } else {
                                ProgressView("Loading popular products...")
                            }
                            
                            
                if !products.isEmpty {
                    JustForYouView(priceRegion: viewModel?.priceRegion ?? "", products: products,
                    addInCartaction: {},
                    addInFavorites: {})
                } else {
                    ProgressView("Loading products for you...")
                }
            }
            .padding(.bottom, 50)
            .onAppear {
                fetchProducts()
        }
                       
    }
    func fetchProducts() {
          viewModel?.getProduct()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
              if let popularProducts = viewModel?.popularProducts, !popularProducts.isEmpty {
                  self.products = popularProducts
              }
          }
      }
    
}

#Preview {
    HomeView(viewModel: HomeViewModel(Dependencies()) )
}
