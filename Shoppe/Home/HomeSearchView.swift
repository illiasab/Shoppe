//
//  HomeSearchView.swift
//  Shoppe
//
//  Created by Marat Fakhrizhanov on 02.03.2025.
//

import SwiftUI

struct HomeSearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Text("Shop") // raleway  28 bold
                .font(.system(size: 28))
            Spacer(minLength: 25)
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundStyle(.customGray) // Color
                    .frame(height: 36)
                TextField("Search", text: $searchText)
                    .onSubmit {
                        // go to SearchView
                        print("go to search")
                    }
                    .padding(.leading,20)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeSearchView(searchText: .constant(""))
}
