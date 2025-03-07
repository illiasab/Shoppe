//
//  HomeView.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 02.03.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    
    var body: some View {
        
        HomeToolbar(userAdress: $homeVM.userAdress,
                    adresses: homeVM.adresses,
                    cartItemsCount: homeVM.cartItemsCount)
        
        HomeSearchView(searchText: $homeVM.searchText)
        
        ScrollView(showsIndicators: false) {
            
            HomeCategoriesView(chooseCategories: homeVM.chooseCategories,
                               action: {print("go to all categoriesView")})
            
            PopularProducts(priceRegion: homeVM.priceRegion,
                            products: homeVM.popularProducts,
                            action: { print("go to popularView")}, priceTransform: homeVM.priceTransform)
            
            JustForYouView(priceRegion: homeVM.priceRegion,
                           products: homeVM.justForYouProducts,
                           addInCartaction: homeVM.addInCart,
                           addInFavorites: homeVM.addInFavorit,
                           priceTransform: homeVM.priceTransform)
        }
        .onAppear {
            
            Task {
//                await homeVM.updateCurrency() // apiKey -300 request
            }

        }
    }
    
}

#Preview {
    HomeView()
}
