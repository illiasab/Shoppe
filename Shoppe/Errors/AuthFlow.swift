//
//  AuthFlow.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/5/25.
//
import Foundation
enum AuthenticationState {
    case unauthenticated
    case authenticating
    case authenticated
}

enum AuthenticationFlow {
    case login
    case signUp
}
