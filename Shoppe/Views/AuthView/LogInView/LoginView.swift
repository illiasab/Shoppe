//
//  LogInView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

struct LoginView: View {
    var viewModel: LoginViewModelDelegate?
    var onLoginSuccess: (() -> Void)?
    var onCancelTapped: (() -> Void)?
    var title = ""
    var body: some View {
        VStack{
            CustomButtonView(title: "Next", action: {
                onLoginSuccess?()
            })
            
            
            Button(action: {
                onCancelTapped?()
            }) {
                Text("Cancel")
                    .applyFont(.raleway,.bold,15)
                    .foregroundColor(.mainBlack)
            }
            .padding(.top,24)
        }
    }
}

#Preview {
    LoginView()
}
