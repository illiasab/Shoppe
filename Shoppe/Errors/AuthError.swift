//
//  AuthError.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/5/25.
//

import FirebaseAuth
import Foundation

import Foundation

enum AuthError: Error {
    case invalidEmail
    case wrongPassword
    case userNotFound
    case emailAlreadyInUse
    case weakPassword
    case tooManyRequests
    case userDisabled
    case networkError
    case tokenExpired
    case missingEmail
    case operationNotAllowed
    case userMismatch
    case accountExistsWithDifferentCredential
    case invalidCredential
    case invalidVerificationCode
    case invalidVerificationID
    case providerError
    case unknownError(message: String)
    
    var localizedDescription: String {
        switch self {
        case .invalidEmail:
            return "The email address is badly formatted."
        case .wrongPassword:
            return "The password is incorrect."
        case .userNotFound:
            return "No user found with this email."
        case .emailAlreadyInUse:
            return "This email is already in use. Please use another email."
        case .weakPassword:
            return "Your password is too weak. Please use a stronger password."
        case .tooManyRequests:
            return "Too many requests. Please try again later."
        case .userDisabled:
            return "This user account has been disabled."
        case .networkError:
            return "Network error. Please check your internet connection."
        case .tokenExpired:
            return "Your session has expired. Please log in again."
        case .missingEmail:
            return "Email is required but missing."
        case .operationNotAllowed:
            return "This operation is not allowed."
        case .userMismatch:
            return "The user credentials do not match."
        case .accountExistsWithDifferentCredential:
            return "An account already exists with a different credential."
        case .invalidCredential:
            return "Invalid credentials provided."
        case .invalidVerificationCode:
            return "The verification code entered is incorrect."
        case .invalidVerificationID:
            return "The verification ID is invalid."
        case .providerError:
            return "Authentication provider returned an error."
        case .unknownError(let message):
            return "Unknown error occurred: \(message)"
        }
    }
}


extension AuthError {
    static func map(_ error: Error) -> AuthError {
        let errorCode = AuthErrorCode(_bridgedNSError: error as NSError)
        switch errorCode?.code {
        case .invalidEmail:
            return .invalidEmail
        case .wrongPassword:
            return .wrongPassword
        case .userNotFound:
            return .userNotFound
        case .emailAlreadyInUse:
            return .emailAlreadyInUse
        case .weakPassword:
            return .weakPassword
        case .tooManyRequests:
            return .tooManyRequests
        case .userDisabled:
            return .userDisabled
        case .networkError:
            return .networkError
        case .invalidUserToken, .userTokenExpired:
            return .tokenExpired
        case .missingEmail:
            return .missingEmail
        case .operationNotAllowed:
            return .operationNotAllowed
        case .userMismatch:
            return .userMismatch
        case .accountExistsWithDifferentCredential:
            return .accountExistsWithDifferentCredential
        case .invalidCredential:
            return .invalidCredential
        case .invalidVerificationCode:
            return .invalidVerificationCode
        case .invalidVerificationID:
            return .invalidVerificationID
        default:
            return .unknownError(message: error.localizedDescription)
        }
    }
}
