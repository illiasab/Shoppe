//
//  SIgnUpView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

struct SignUpView: View {
    var viewModel: SignUpViewModelDelegate?
    var onSignUpSuccess: (() -> Void)?
    var title = ""
    var body: some View {
        Text("Sign Up")
    }
}


#Preview {
    SignUpView()
}
