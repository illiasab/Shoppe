//
//  SignUpViewModel.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

protocol SignUpViewModelDelegate {
    
}
final class SignUpViewModel: SignUpViewModelDelegate {
    private var authService: IAuthService?
    private var userDefaultsRepository: IUserDefaultsRepository?
    
    init(_ dependencies: IDependencies) {
        authService = dependencies.authService
        userDefaultsRepository = dependencies.userDefaultsRepository
    }
}
