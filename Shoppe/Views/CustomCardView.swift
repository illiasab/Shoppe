//
//  CustomCardView.swift
//  Shoppe
//
//  Created by Андрей Завадский on 03.03.2025.
//

import SwiftUI

struct CustomCardView: View {
    let product: Product
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
            
            Text(product.name)
                .applyFont(.nunitoSans, .regular, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Text(product.price)
                .applyFont(.raleway, .bold, 17)
                .frame(maxWidth: .infinity, alignment: .leading)
            
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
                
                Spacer()
                Button(action: {}) {
                    Image(systemName: "heart")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                }
                .padding(.trailing, 10)
            }
        }
        .background(RoundedRectangle(cornerRadius: 10)
        .fill(Color.white)
        .shadow(radius: 3))
    }
}


#Preview {
    let product = Product(name: "Lorem ipsum dolor sit amet consectetur", price: "$17,00", imageName: "pinkSkirt")
    
    return CustomCardView(product: product)
        .frame(width: 165, height: 282, alignment: .bottom)
}
