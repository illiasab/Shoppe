//
//  AuthCoordinator.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import UIKit
import SwiftUI

protocol AuthCoordinatorProtocol: Coordinator {
    func start()
}

final class AuthCoordinator: AuthCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .auth }
    var dependencies: IDependencies
    var onAuthSuccess: (() -> Void)?
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showStartView()
    }
    
    private func showStartView() {
        var startView = AuthAssembly.configureStartView(dependencies)
        
        startView.onLoginTapped = { [weak self] in
            self?.showLoginView()
        }
        
        startView.onSignUpTapped = { [weak self] in
            self?.showSignUpView()
        }
        
        let hostingController = UIHostingController(rootView: AnyView(startView))
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    private func showLoginView() {
        var loginView = AuthAssembly.configureLoginView(dependencies)
        loginView.onLoginSuccess = { [weak self] in
            self?.didAuthenticateUser()
        }
        
        let hostingController = UIHostingController(rootView: AnyView(loginView))
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    private func showSignUpView() {
        var signUpView = AuthAssembly.configureSignUpView(dependencies)
        
        signUpView.onSignUpSuccess = { [weak self] in
            self?.didAuthenticateUser()
        }
        
        let hostingController = UIHostingController(rootView: AnyView(signUpView))
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    private func didAuthenticateUser() {
        onAuthSuccess?()
    }
}
