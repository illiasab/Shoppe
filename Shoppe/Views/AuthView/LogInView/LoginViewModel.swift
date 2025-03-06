//
//  LoginViewModel.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//
import Foundation
import FirebaseAuth

protocol LoginViewModelDelegate: AnyObject {
    func login(email: String, password: String, completion: @escaping (Result<Bool, AuthError>) -> Void)
}


final class LoginViewModel: LoginViewModelDelegate {
    private let authService: IAuthService
    private let userDefaultsRepository: IUserDefaultsRepository

    init(_ dependencies: IDependencies) {
        self.authService = dependencies.authService
        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }

    func login(email: String, password: String, completion: @escaping (Result<Bool, AuthError>) -> Void) {
        Task {
            let result = await authService.logInWithEmail(email: email, password: password)
            completion(result)
        }
    }
}

