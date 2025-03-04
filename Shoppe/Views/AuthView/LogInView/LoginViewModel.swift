//
//  LoginViewModel.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

protocol LoginViewModelDelegate: AnyObject {
    
}

final class LoginViewModel: LoginViewModelDelegate {
    private var authService: IAuthService?
    private var userDefaultsRepository: IUserDefaultsRepository?
    
    init(_ dependencies: IDependencies) {
        authService = dependencies.authService
        userDefaultsRepository = dependencies.userDefaultsRepository
    }
}
