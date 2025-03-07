//
//  CustomCardView.swift
//  Shoppe
//
//  Created by Андрей Завадский on 03.03.2025.
//

import SwiftUI

struct CustomCardView: View {
    let product: Product
    @State private var isFavourite = false
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 4))
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
            
            Text(product.name)
                .applyFont(.nunitoSans, .regular, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.top, 4)
            
            Text(product.price)
                .applyFont(.raleway, .bold, 17)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
            
            HStack {
                Button(action: {}) {
                    Text("Add to cart")
                        .applyFont(.inter, .regular, 10)
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
               // Spacer()
                Button(action: {isFavourite.toggle()}) {
                    Image(systemName: isFavourite ? "heart.fill" : "heart")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                }
                .padding(.trailing, 10)
            }
        }
        .padding(.top, 10)
        .background(RoundedRectangle(cornerRadius: 10)
        .fill(Color.white))
    }
}


#Preview {
    let product = Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt")
    
    return CustomCardView(product: product)
        .frame(width: 165, height: 282, alignment: .bottom)
}
