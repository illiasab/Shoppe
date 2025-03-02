//
//  PopularItemsView.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 03.03.2025.
//

import SwiftUI

struct PopularProducts: View {
    let action: ()-> Void
    let products: [Product]
    
    
    var body: some View {
        VStack(spacing: 20) {
            ScrollButtons(title: "Popular", button: true, action: {action()})
                .padding(.horizontal,20)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(products, id:\.id) { product in
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 9)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                                .padding(5)
                            
                            AsyncImage(url: URL(string: product.imageUrl)) { Image in
                                Image
                                    .resizable()
                                    .scaledToFill()
                                
                            } placeholder: {
                                Image("adidas")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                        }
                        .frame(width: 140, height: 140)
                        
                    }
                    .padding(.leading,20)
                }
            }
            .frame(height: 140)
        }
    }
}

#Preview {
    PopularProducts(action: {}, products: [Product(title: "Adidas", price: "99", imageUrl: "", description: ""), Product(title: "Adidas", price: "99", imageUrl: "", description: ""), Product(title: "Adidas", price: "99", imageUrl: "", description: ""), Product(title: "Adidas", price: "99", imageUrl: "", description: ""), Product(title: "Adidas", price: "99", imageUrl: "", description: "")])
}
