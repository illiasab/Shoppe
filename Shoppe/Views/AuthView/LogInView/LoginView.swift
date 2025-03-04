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
    var title = ""
    var body: some View {
        Text("Log In")
    }
}

#Preview {
    LoginView()
}
