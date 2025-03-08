//
//  ShoppeApp.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//

import SwiftUI
import Firebase
@main
struct ShoppeApp: App {
    @StateObject var dependencies = Dependencies()
    @State var selectedTab: TabType = .home

    init(){
        FirebaseApp.configure()
        setupTabBarAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            TabView() {
                CoordinatorView(dependencies: dependencies)
                    .edgesIgnoringSafeArea(.all)
                    .tabItem {
                        Image("Shopz")
                            .renderingMode(.template)
                    }
                    .tag(TabType.home)
                
                CoordinatorView(dependencies: dependencies)
                    .edgesIgnoringSafeArea(.all)
                    .tabItem {
                        Image("heartz")
                            .renderingMode(.template)
                    }
                    .tag(TabType.favorites)
                
                CoordinatorView(dependencies: dependencies)
                    .edgesIgnoringSafeArea(.all)
                    .tabItem {
                        Image("Categoriesz")
                            .renderingMode(.template)
                    }
                    .tag(TabType.category)
                
                CoordinatorView(dependencies: dependencies)
                    .edgesIgnoringSafeArea(.all)
                    .tabItem {
                        Image("cartz")
                            .renderingMode(.template)
                    }
                    .tag(TabType.cart)
                
                CoordinatorView(dependencies: dependencies)
                    .edgesIgnoringSafeArea(.all)
                    .tabItem {
                        Image("human")
                            .renderingMode(.template)
                    }
                    .tag(TabType.profile)
            }
        }
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        appearance.stackedLayoutAppearance.selected.iconColor = .black
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]

        appearance.stackedLayoutAppearance.normal.iconColor = .blue
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.mainBlue]

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .mainBlue
    }
    
    enum TabType {
        case home
        case favorites
        case category
        case profile
        case cart
    }
}








