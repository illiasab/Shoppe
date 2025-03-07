//
//  HomeView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
////
//import SwiftUI
//
//struct HomeView: View {
//    var viewModel: HomeViewModelDelegate?
//    @State private var productImages: [String:Image] = [:]
//
//    
//    var body: some View {
//        ScrollView{
//            VStack {
//                ForEach(viewModel?.products ?? [], id: \.self) { product in
//                    VStack {
//                        Text(product.category)
//                        
//                        Button(action: {
//                            viewModel?.loadImage(from: product) { image in
//                                if let image = image {
//                                    productImages[product.image ?? ""] = image
//                                }
//                            }
//                        }) {
//                            Text("Load Image for \(product.category ?? "Unknown Product")")
//                        }
//                        
//                        if let image = productImages[product.image ?? ""] {
//                            image
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 200, height: 200)
//                        } else {
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .onAppear {
//                viewModel?.getProduct()
//                viewModel?.updateHandler = { loadedProducts in
//                    products = products
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    HomeView(viewModel: HomeViewModel(Dependencies()))
//}
