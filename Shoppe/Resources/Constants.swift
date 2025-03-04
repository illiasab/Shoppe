//
//  Constants.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import Foundation

enum API {
    static let baseUrl = "https://fakestoreapi.com/"
}

enum Constants {
    static let LaunchTitle = "Shoppe"
    static let onboardingTitleFirst = "Welcome"
    static let onboardingTitleSecond = "Smart Search & Favorites"
    static let onboardingTitleThird  = "Easy Checkout"
    static let onboardingTitleFourth = "Manage Your Store"
    static let onboardingDescriptionFirst = "Discover a fast and easy way to shop online."
    static let onboardingDescriptionSecond = "Find products instantly and save favorites for later."
    static let onboardingDescriptionThird = "Add to cart, choose payment, and order in seconds."
    static let onboardingDescriptionFourth = "Become a manager, add products, and control your catalog!"
    static let okString = "OK"
    static let start = "Let's get started"
    static let haveAccount = "I already have an account"
    static let signUp = "Create Account"
    static let LogIn = "Login"
}

enum ImageName {
    static let shoppeBag = "ShoppeBag"
}

enum SystemImageName {
//
}

enum UserDefaultsKey {
    static let onboardingComplete = "OnboardingComplete"
    static let isRegistredUser = "RegistraitedUser"
    static let isAuthUser = "UserAuthed"
    static let isNotUser = "RegistrationNeeded"
}

enum CoreDataConstant {
    static let FavouritesContainer = "FavouritesContainer "
    static let AuthContainerName: String  = "AuthContainer"
    static let CategoryContainerName: String = "CategoryContainer"
    static let CartContainerName: String = "CartConttainer"
    static let PaymentContainerName: String = "PaymentContainer"
}
