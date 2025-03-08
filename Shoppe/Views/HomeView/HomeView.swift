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
    var onCancelTapped: (() -> Void)?
    var allCategoriesTapped: (() -> Void)?
    var didCategoryEventHandler: ((CategoryEvent) -> Void)?


    init(viewModel: HomeViewModelDelegate?) {
        self.viewModel = viewModel

    }
    enum CategoryEvent{
        case backButtonTapped
        case toAllCategoriesTapped
    }
    
    var body: some View {
        
        HomeToolbar(userAdress: $userAdress,
                    adresses: viewModel?.adresses ?? [],
                        cartItemsCount: viewModel?.cartItemsCount ?? 2)
        
            HomeSearchView(searchText: $searchText)
        
        ScrollView(showsIndicators: false) {
                
            HomeCategoriesView(chooseCategories: viewModel?.chooseCategories ?? [.bags],
                               action: {
                viewModel?.onAllCategoriesTapped()
                print("Event Triggered: Going to All Categories")

            })
                
            if !products.isEmpty {
                PopularProducts(adres: userAdress, priceRegion: viewModel?.priceRegion ?? "",
                                                products: products,
                                            action: {
                    viewModel?.onAllCategoriesTapped()
                                                        },
                                priceTransform: viewModel?.priceTransform ?? { _ , _ in return 0.0} )
                            } else {
                                ShimmerPopularProducts()
                            }
                            
                            
                if !products.isEmpty {
                    JustForYouView(adres: userAdress, priceRegion: viewModel?.priceRegion ?? "", products: products,
                    addInCartaction: {},
                                   addInFavorites: {},
                                   priceTransform: viewModel?.priceTransform ?? { _ , _ in return 0.0})
                } else {
                    ShimmerJustForYouView()
                }
            }
            .onAppear {
                fetchProducts()
        }
                       
    }
    func fetchProducts() {
          viewModel?.getProduct()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
              if let popularProducts = viewModel?.popularProducts, !popularProducts.isEmpty {
                  self.products = popularProducts
              }
          }
      }
    
}

#Preview {
    HomeView(viewModel: HomeViewModel(Dependencies()))
}
