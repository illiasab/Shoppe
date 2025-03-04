//
//  AuthAssembly.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

final class AuthAssembly {
    static func configureStartView(_ dependencies: IDependencies) -> StartView {
        var view = StartView()
        let signUpVC = configureSignUpView(dependencies)
        let loginVC = configureLoginView(dependencies)
        view.controllers = [signUpVC, loginVC]
        view.startIndex = 0
        return view
    }

    static func configureSignUpView(_ dependencies: IDependencies) -> SignUpView {
        var view = SignUpView()
        let viewModel = SignUpViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }

    static func configureLoginView(_ dependencies: IDependencies) -> LoginView {
        var view = LoginView()
        let viewModel = LoginViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }
}
