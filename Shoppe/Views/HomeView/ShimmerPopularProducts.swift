//
//  ShimmerPopularProducts.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 07.03.2025.
//

import SwiftUI

struct ShimmerPopularProducts: View {
    
    var body: some View {
        VStack( spacing: 5) {
            ScrollButtons(title: "Popular", button: true, action:{}, shimmer: true)
                .padding(.horizontal,20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<4) { number in
                        VStack() {
                            // IMAGE
                            ZStack{
                                RoundedRectangle(cornerRadius: 9)
                                    .foregroundStyle(.startButtonTitle)
                                    .shadow(color: .mainBlack.opacity(0.2), radius: 5, x: 0, y: 5)
                                RoundedRectangle(cornerRadius: 9)
                                    .foregroundStyle(.white)
                                    .padding(6)
                                    .shimmering()
                            }
                            .frame(width: 140, height: 140)
                            // TEXT
                            VStack(){
                                HStack{ // alignment ????
                                    Text("Loading . . . 👾")
                                        .applyFont(.nunitoSans,.regular,12)
                                        .lineLimit(2)
                                        .frame(height: 30)
                                        .shimmering()
                                    Spacer()
                                }
                                
                                HStack { // alignment ????
                                    Text("$ $ $")
                                        .applyFont(.raleway,.bold,17)
                                        .shimmering()
                                    Spacer()
                                }
                            }
                            .frame(width: 140)
                        }
                    }
                }
                .padding(.leading,20)
            }
        }
        .frame(height: 247)
        .padding(.top,20)
    }
}

#Preview {
    ShimmerPopularProducts()
}
