//
//  TabBarMockView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/7/25.
//
import SwiftUI


struct TabBarMockView: View {
    @ObservedObject var viewRouter: ViewRouter
     
    var controllers: [any View] = []
    var startIndex = 0
    var body: some View {
        GeometryReader { geometry in
            VStack {
                switch viewRouter.currentTab {
                case .home:
                    HomeView(viewModel: HomeViewModel(Dependencies()))
                case .profile:
                    Text("ProfileView")
                case .carts:
                    Text("CartsView")
                case .favorites:
                    WishListView()
                case .categories:
                    HomeView(viewModel: HomeViewModel(Dependencies()))
                }
                
                Spacer()
                
                // Custom Tab Bar
                HStack {
                    TabBarIcon(viewRouter: viewRouter,
                               width: 24,
                               height: 24,
                               tab: .home, iconName: "Shopz", tabName: "Home")
                    
                    TabBarIcon(viewRouter: viewRouter,
                               width: 24,
                               height: 24,
                               tab: .favorites, iconName: "heartz", tabName: "Favorites")
                    
                    TabBarIcon(viewRouter: viewRouter,
                               width: 24,
                               height: 24,
                               tab: .categories, iconName: "Categoriesz", tabName: "Category")
                    
                    TabBarIcon(viewRouter: viewRouter,
                               width: 24,
                               height: 24,
                               tab: .carts, iconName: "cartz", tabName: "Carts")
                    
                    TabBarIcon(viewRouter: viewRouter,
                               width: 24,
                               height: 24,
                               tab: .profile, iconName: "human", tabName: "Profile")
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 8)
                .background(Color("Bg")
                    .shadow(color: Color(red: 0.61, green: 0.7, blue: 0.84).opacity(0.13), radius: 4, x: 0, y: -3))
            }
            .edgesIgnoringSafeArea(.bottom)
            .edgesIgnoringSafeArea(.top)
        }
        .environmentObject(viewRouter)
    }
}

#Preview{
    TabBarMockView(viewRouter: ViewRouter())
}
