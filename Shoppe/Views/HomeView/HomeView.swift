//
//  HomeView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//
import SwiftUI

struct HomeView: View {
    var viewModel: HomeViewModel?
    @State private var products: [Products] = []
    @State private var productImages: [String:Image] = [:]

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach(products, id: \.self) { product in
                    VStack {
                        Text(product.title ?? "Unknown Product")
                        
                        Button(action: {
                            viewModel?.loadImage(from: product) { image in
                                if let image = image {
                                    productImages[product.image ?? ""] = image
                                }
                            }
                        }) {
                            Text("Load Image for \(product.title ?? "Unknown Product")")
                        }
                        
                        if let image = productImages[product.image ?? ""] {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        } else {
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel?.getProduct()
                viewModel?.updateHandler = { loadedProducts in
                    self.products = loadedProducts
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(Dependencies()))
}
