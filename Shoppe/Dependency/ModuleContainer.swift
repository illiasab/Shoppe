//
//  ModuleContainer.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//
import UIKit
import SwiftUI

protocol IModuleContainer {
    func getLaunchView() -> any View
    func getOnboardingView() -> any View
    func getStartView() -> any View
    func getSignUpView() -> any View
    func getLoginView() -> any View
    func getHomeView() -> any View
    func getTabBarMockView() -> any View
    func getAllCategoriesView() -> any View
//    func getProfileView() -> any View
}


final class ModuleContainer: IModuleContainer {
    private let dependencies: IDependencies
    required init(_ dependencies: IDependencies) {
        self.dependencies = dependencies
    }
}


// MARK: - LaunchView
extension ModuleContainer {
    func getLaunchView() -> any View {
        return LaunchView()
    }
}

// MARK: - SignUpView
extension ModuleContainer {
    func getSignUpView() -> any View {
        var view = SignUpView()
        view.title = Constants.signUp
        let viewModel = SignUpViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }
}

// MARK: - LoginView
extension ModuleContainer {
    func getLoginView() -> any View {
        var view = LoginView()
        view.title = Constants.LogIn
        let viewModel = LoginViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }
}

// MARK: - OnboardingView
extension ModuleContainer {
    func getOnboardingView() -> any View {
        return OnboardingView()
    }
}

// MARK: - StartView
extension ModuleContainer {
    func getStartView() -> any View {
        var view = StartView()
        let SignUpVC = SignUpAssembly.configure(dependencies)
        let LoginVC = LoginAssembly.configure(dependencies)
        view.controllers = [SignUpVC, LoginVC]
        view.startIndex = 0
        return view
    }
}

// MARK: - HomeView
extension ModuleContainer {
    func getHomeView() ->  any View {
        var view = HomeView(viewModel: HomeViewModel(dependencies))
        let viewModel = HomeViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }
}
// MARK: - TabBarView
extension ModuleContainer{
    func getTabBarMockView() -> any View {
        var view = TabBarMockView(viewRouter: ViewRouter())
        let homeVc = HomeAssembly.configure(dependencies)
        view.controllers = [homeVc]
        view.startIndex = 0
        return view
    }
}

// MARK: - AllCategoriesView
extension ModuleContainer{
    func getAllCategoriesView() -> any View {
        let view = AllCategoriesView()
        return view
    }
}

// MARK: - ProfileView
//extension ModuleContainer {
//    func getProfileView() -> any View {
//        let view = ProfileView()
//        let viewModel = ProfileViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}
