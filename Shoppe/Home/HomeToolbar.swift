//
//  HomeToolbar.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 02.03.2025.
//

import SwiftUI


struct HomeToolbar: View {
    @Binding var userAdress: String             //"Salatiga City, Central Java"
    let adresses: [String]
    let cartItemsCount: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("Delivery address")
                    .font(.system(size: 10))                    //FONT
                    .foregroundStyle(.gray)
                
                Picker("choose adress", selection: $userAdress) {
                    ForEach(adresses, id: \.self) { adress in
                        HStack {
                            Text(adress)
                                .font(.system(size: 12))          // font
                        }
                    }
                }
                .ignoresSafeArea()
                .pickerStyle(.menu)
            }
            Spacer()
            //Cart
            Button {
                // go to cart
                print("go to cart view")
            } label: {
                ZStack {
                    Image(systemName: "cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    ZStack {
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(.red)
                        
                        Text(String(cartItemsCount))
                            .font(.system(size: 8))          // font
                            .foregroundStyle(.white)
                    }
                    .offset(x: 13, y: -13)
                }
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal,15)
    }
}

#Preview {
    HomeToolbar(userAdress: .constant("Salatiga City, Central Java"), adresses: ["Salatiga City, Central Java","Moscow", "France", "USA"], cartItemsCount: 2)
}
