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
                .applyFont(.raleway,.bold,21)
            Spacer()
            if button {
                Button {
                    action()
                } label: {
                    HStack {
                        Text("See All")
                            .applyFont(.raleway,.bold,15)
                            .foregroundStyle(.black)
                        ZStack {
                            Circle()
                                .frame(width:30)
                                .foregroundStyle(.mainBlue)
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
