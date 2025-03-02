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
        
            ScrollView {
                
                HomeCategoriesView(chooseCategories: homeVM.chooseCategories,
                                   action: {print("go to all categoriesView")})
                
                PopularProducts(action: { print("go to popularView")},
                                products: homeVM.popularProducts)
                
            }
            
    }
    
}

#Preview {
    HomeView()
}
