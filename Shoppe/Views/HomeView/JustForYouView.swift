//
//  JustForYouView.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 04.03.2025.
//

import SwiftUI

struct JustForYouView: View {
    
    let homeVM = HomeViewModel()
    
    let priceRegion: String
    let products: [Product]
    let addInCartaction: () -> Void
    let addInFavorites: () -> Void
    let priceTransform: (String) -> Double
    
    var body: some View {
        ScrollButtons(title: "Just For You", button: false, action: {})
            .padding(.horizontal,20)
            .padding(.top,20)
        
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]) {
            ForEach(products, id:\.id) { product in
                VStack(alignment: .leading, spacing: 7) {
                    VStack(alignment: .leading) {
                        // IMAGE
                        AsyncImage(url: URL(string: product.imageUrl)) { Image in
                            Image
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 9))
                        } placeholder: {
                            Image("PlaceholderProduct")
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 9))
                        }
                        //TEXT
                        Text(product.description)
                            .applyFont(.nunitoSans,.light,12)
                            .lineLimit(2)
                            .frame(height: 30)
                    }
                    .onTapGesture {
                        // go to Product INFO view
                        print("go to productinfo view ( product id: \(product.id)")
                    }
                    HStack {
                        Text("\(priceTransform(product.price), format: .currency(code: priceRegion))")
                            .applyFont(.raleway,.bold,17)
                        Spacer()
                        Button {
                            addInFavorites()
                        } label: {
                            Image(systemName: "heart") // add favorite  in  model
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.favoriteRed)
                                .frame(width: 20)
                        }
                    }
                    Button {
                        addInCartaction()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(.mainBlue)
                                .frame(height: 30)
                            Text("Add to cart")
                                .applyFont(.inter,.regular, 12)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom,100) // for tabbar
    }
}

//#Preview {
//    JustForYouView(priceRegion: "RUR", products: [Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur."), Product(title: "Adidas", price: "99", imageUrl: "", description: "Lorem ipsum dolor sit amet consectetur")], addInCartaction: {print("in cart")}, addInFavorites: {print("in favorit")}, priceTransform:  { _ in return 0.0 })
//}
