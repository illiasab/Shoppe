//
//  PopularItemsView.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 03.03.2025.
//

import SwiftUI

struct PopularProducts: View {
    let priceRegion: String
    let products: [Products]
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 5) {
            ScrollButtons(title: "Popular", button: true, action: {action()})
                .padding(.horizontal,20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(products, id:\.id) { product in
                        VStack {
                            // IMAGE
                            ZStack {
                                RoundedRectangle(cornerRadius: 9)
                                    .foregroundStyle(.white)
                                    .shadow(radius: 5)
                                
                                AsyncImage(url: URL(string: product.image ?? "")) { Image in
                                    Image
                                        .resizable()
                                        .scaledToFill()
                                        .padding(5)
                                } placeholder: {
                                    Image("adidasPopular")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(5)
                                }
                            }
                            .frame(width: 140, height: 140)
                            // TEXT
                            VStack(alignment: .leading){
                                Text(product.title ?? "")
                                    .applyFont(.nunitoSans,.regular,12)
                                    .lineLimit(2)
                                    .frame(height: 30)
                                
                                Text("\(Double(product.price), format: .currency(code: priceRegion))")
                                    .applyFont(.raleway,.bold,17)
                            }
                            .frame(width: 140)
                        }
                    }
                }
                .padding(.leading,20)
            }
        }
        .frame(height: 247)
    }
}

#Preview {
//    PopularProducts(priceRegion: "EUR", products: [Products(title: "Adid", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: ""), ProductMock(title: "Adidas", price: "99", imageUrl: "", description: "")], action: {})
}
