//
//  ScrollButtons.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 02.03.2025.
//

import SwiftUI

struct ScrollButtons: View {
    let title: String
    let button: Bool
    let action: ()-> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 21)) // rele 21 med
            Spacer()
            if button {
                Button {
                    action()
                } label: {
                    HStack {
                        Text("See All")
                            .font(.system(size: 15)) // rele 15 med
                            .foregroundStyle(.black)
                        ZStack {
                            Circle()
                                .frame(width:30)
                                .foregroundStyle(.cyan) // Color
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .foregroundStyle(.white)
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollButtons(title: "Categories", button: true, action: {})
}
