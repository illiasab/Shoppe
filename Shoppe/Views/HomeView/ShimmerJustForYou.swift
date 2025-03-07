//
//  ShimmerJustForYou.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 07.03.2025.
//

import SwiftUI

struct ShimmerJustForYouView: View {
    
    var body: some View {
        ScrollButtons(title: "Just For You", button: false, action: {}, shimmer: true)
            .padding(.horizontal,20)
            .padding(.top,20)
        
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]) {
            ForEach(0..<4) { number in
                VStack(alignment: .leading, spacing: 7) {
                    VStack(alignment: .leading) {
                        // IMAGE
                        RoundedRectangle(cornerRadius: 9)
                            .frame(height: 316)
                            .foregroundStyle(.startButtonTitle)
                            .shimmering()
                        //TEXT
                        Text("Loading . . . 👾")
                        .applyFont(.nunitoSans,.light,12)
                        .lineLimit(2)
                        .frame(height: 30)
                        .shimmering()
                    }
                    HStack {
                        Text("$ $ $")
                            .applyFont(.raleway,.bold,17)
                            .shimmering()
                        Spacer()
                        
                        Image(systemName: "heart") // add favorite  in  model
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.favoriteRed)
                            .frame(width: 20)
                            .shimmering()
                        
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.mainBlue)
                            .frame(height: 30)
                        Text("Add to cart")
                            .applyFont(.inter,.regular, 12)
                            .foregroundStyle(.white)
                            .shimmering()
                    }
                    
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
#Preview {
    ShimmerJustForYouView()
}
