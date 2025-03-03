//
//  UserDefaultsRepository.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import Foundation

protocol IUserDefaultsRepository {
    var isOnboardingCompleteBefore: Bool { get }
    var isRegistredUserBefore: Bool { get }
    var isAuthenticatedUser: Bool {get }
    var isNotUserYet: Bool { get }
    func setOnboardingComplete()
}

struct UserDefaultsRepository: IUserDefaultsRepository {
    private let container: UserDefaults
    
    init(container: UserDefaults) {
        self.container = container
    }
    
    var isOnboardingCompleteBefore: Bool {
        return container.bool(forKey: UserDefaultsKey.onboardingComplete)
    }
    var isRegistredUserBefore: Bool {
        return container.bool(forKey: UserDefaultsKey.isRegistredUser)
    }
    var isAuthenticatedUser: Bool {
        return container.bool(forKey: UserDefaultsKey.isAuthUser)
    }
    var isNotUserYet: Bool {
        return container.bool(forKey: UserDefaultsKey.isNotUser)
    }
    
   
    func setOnboardingComplete() {
        container.set(true, forKey: UserDefaultsKey.onboardingComplete)
    }
}
