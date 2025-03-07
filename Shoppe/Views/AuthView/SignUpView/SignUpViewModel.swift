//
//  SignUpViewModel.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//
import Foundation
import FirebaseAuth

protocol SignUpViewModelDelegate {
    func signUp(email: String, password: String, completion: @escaping (Result<Bool, AuthError>) -> Void) async
}

final class SignUpViewModel: SignUpViewModelDelegate {
    private let authService: IAuthService
    private let userDefaultsRepository: IUserDefaultsRepository
    private let usersModel = UsersModel.shared
    
    init(_ dependencies: IDependencies) {
        self.authService = dependencies.authService
        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }
    
    @MainActor
    func signUp(email: String, password: String, completion: @escaping (Result<Bool, AuthError>) -> Void) {
        Task { [weak self] in
            guard let self = self else { return }
            
            let result = await authService.signUpWithEmailPassword(email: email, password: password)
            
            DispatchQueue.main.async {
                switch result {
                case .success:
                    let newUserId = Int.random(in: 1000...9999) // Генерация ID
                    self.usersModel.addUser(id: newUserId, username: email, password: password) // Сохраняем пользователя
                    completion(.success(true))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
