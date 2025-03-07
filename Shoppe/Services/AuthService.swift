//
//  AuthService.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//
import Foundation
import FirebaseAuth

protocol IAuthService {
    var authenticationStateChanged: ((AuthenticationState) -> Void)? { get set }
    func registerAuthStateHandler()
    func wait() async
    func logInWithEmail(email: String, password: String) async -> Result<Bool, AuthError>
    func signUpWithEmailPassword(email: String, password: String) async -> Result<Bool, AuthError>
    func signOut()
    func deleteAccount() async -> Bool
}

struct AuthService: IAuthService {
    var authenticationStateChanged: ((AuthenticationState) -> Void)?
    private var userDefaultsRepository: IUserDefaultsRepository
    private static var authStateHandler: AuthStateDidChangeListenerHandle?

    init(dependencies: IDependencies) {
        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }

    func registerAuthStateHandler() {
        if AuthService.authStateHandler == nil {
            AuthService.authStateHandler = Auth.auth().addStateDidChangeListener { _, user in
                let newState: AuthenticationState = user == nil ? .unauthenticated : .authenticated
                authenticationStateChanged?(newState)
            }
        }
    }

    func wait() async {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {
            print(error.localizedDescription)
        }
    }

    func logInWithEmail(email: String, password: String) async ->  Result<Bool, AuthError> {
        authenticationStateChanged?(.authenticating)
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            authenticationStateChanged?(.authenticated)
            return .success(true)
        } catch {
            authenticationStateChanged?(.unauthenticated)
            return .failure(AuthError.map(error))
        }
    }

    func signUpWithEmailPassword(email: String, password: String) async -> Result<Bool, AuthError>  {
        authenticationStateChanged?(.authenticating)
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
            authenticationStateChanged?(.authenticated)
            return .success(true)
        } catch {
            authenticationStateChanged?(.unauthenticated)
            return .failure(AuthError.map(error))
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            authenticationStateChanged?(.unauthenticated)
        } catch {
            print(error)
        }
    }

    func deleteAccount() async -> Bool {
        guard let user = Auth.auth().currentUser else { return false }
        do {
            try await user.delete()
            authenticationStateChanged?(.unauthenticated)
            return true
        } catch {
            return false
        }
    }
}
