//
//  SignUpViewModel.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//
import Foundation
import FirebaseAuth
protocol SignUpViewModelDelegate {
    func signUp(email: String, password: String, completion: @escaping (Result<Bool, AuthError>) -> Void)
}

final class SignUpViewModel: SignUpViewModelDelegate {
    private let authService: IAuthService
    private let userDefaultsRepository: IUserDefaultsRepository

    init(_ dependencies: IDependencies) {
        self.authService = dependencies.authService
        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }

    func signUp(email: String, password: String, completion: @escaping (Result<Bool, AuthError>) -> Void) {
        Task {
            let success = await authService.signUpWithEmailPassword(email: email, password: password)
            completion(success)
        }
    }
}
