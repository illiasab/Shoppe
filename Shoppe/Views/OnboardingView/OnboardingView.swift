//
//  OnboardingView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

struct OnboardingView: View {
    enum Event {
        case onboardingComplete
    }
    
    var didSendEventHandler: ((OnboardingView.Event) -> Void)?
    
    // Define the page index for tabView
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<4, id: \.self) { index in
                    VStack {
                        Text("Page \(index + 1)")
                            .font(.largeTitle)
                            .padding()
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                            .padding()
                        Text("This is slide \(index + 1) content.")
                            .font(.body)
                            .padding()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 300)
            
            Button(action: {
                print("✅ отправляем событие launchComplete")
                didSendEventHandler?(.onboardingComplete)
            }) {
                Text("Complete Onboarding")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
