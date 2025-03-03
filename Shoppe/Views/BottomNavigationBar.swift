//
//  BottomNavigationBar.swift
//  Shoppe
//
//  Created by Андрей Завадский on 03.03.2025.
//

import SwiftUI

struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {}) {
                Image(systemName: "house")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "heart")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "list.bullet")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "bag")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "person")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            Spacer()
        }
        .padding()
        .background(Color.white.shadow(radius: 2))
    }
}

#Preview {
    BottomNavigationBar()
}
