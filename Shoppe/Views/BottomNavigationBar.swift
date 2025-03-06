//
//  BottomNavigationBar.swift
//  Shoppe
//
//  Created by Андрей Завадский on 03.03.2025.
//

import SwiftUI

struct BottomNavigationBar: View {
    @State private var selectedTab: String = "shop"
    var body: some View {
        HStack {
            Spacer()
            Button(action: {selectedTab = "shop"}) {
                Image(selectedTab == "shop" ? "shopActive" :"shopz")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            Spacer()
            Button(action: {selectedTab = "heart"}) {
                Image(selectedTab == "heart" ? "heartActivez" : "heartz")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            Spacer()
            Button(action: {}) {
                Image("Categoriesz")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            Spacer()
            Button(action: {selectedTab = "cart"}) {
                Image(selectedTab == "cart" ? "cartActivez" : "cartz")
                    .font(.title2)
                    .foregroundColor(.blue)
                
            }
            Spacer()
            Button(action: {selectedTab = "human"}) {
                Image(selectedTab == "human" ? "humanActive" : "human")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            Spacer()
        }
        .padding()
        .background(Color.white.shadow(radius: 2))
    }
}

#Preview {
    BottomNavigationBar()
}
