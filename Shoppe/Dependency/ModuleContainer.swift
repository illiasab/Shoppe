//
//  ModuleContainer.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//
import SwiftUI

protocol IModuleContainer {
    func getLaunchView() -> any View
//    func getOnboardingView() -> any View
//    func getStartView() -> any View
//    func getSignUpView() -> any View
//    func getLoginView() -> any View
//    func getMainView()-> any View
//    func getHomeView() -> any View
//    func getSearchView() -> any View
//    func getProductView() -> any View
//    func getWishListView() -> any View
//    func getCartView() -> any View
//    func getPaymentView() -> any View
//    func getCategoryView() -> any View
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
//extension ModuleContainer {
//    func getSignUpView() -> any View {
//        let view = SignUpView()
//        view.title = Constants.all
//        let viewModel = SignUpViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - LoginView
//extension ModuleContainer {
//    func getLoginView() -> any View {
//        let view = LoginView()
//        view.title = Constants.all
//        let viewModel = LoginViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - OnboardingView
//extension ModuleContainer {
//    func getOnboardingView() -> any View {
//        let view = OnboardingView()
//        let viewModel = OnboardingViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - StartView
//extension ModuleContainer {
//    func getStartView() -> any View {
//        let view = StartView()
//        let SignUpVC = SignUpAssembly.configure(dependencies)
//        let LoginVC = LoginAssembly.configure(dependencies)
//        view.controllers = [SignUpVC, LoginVC]
//        view.startIndex = 0
//        return view
//    }
//}

// MARK: - MainView
//extension ModuleContainer {
//    func getMainView() -> any View {
//        let view = MainView()
//        let HomeVC = HomeAssembly.configure(dependencies)
//        let FovouritesVC = FavouritesAssembly.configure(dependencies)
//        let CategoryVC = CategoryAssembly.configure(dependencies)
//        let CartVC = CartAssembly.configure(dependencies)
//        let settingsVC = SettingsAssembly.configure(dependencies)
//        view.controllers = [HomeVC, FovouritesVC, CategoryVC, CartVC, settingsVC]
//        view.startIndex = 0
//        return view
//    }
//}

// MARK: - HomeView
//extension ModuleContainer {
//    func getHomeView() -> any View {
//        let view = HomeView()
//        let viewModel = HomeViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - SearchView
//extension ModuleContainer {
//    func getSearchView() -> any View {
//        let view = SearchView()
//        let viewModel = SearchViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - ProductView

//extension ModuleContainer {
//    func getProductView() -> any View {
//        let view = ProductView()
//        let viewModel = ProductViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - WishListView
//extension ModuleContainer {
//    func getWishListView() -> any View {
//        let view = WishListView()
//        let viewModel = WishListViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - CartView
//extension ModuleContainer {
//    func getCartView() -> any View {
//        let view = CartView()
//        let viewModel = CartViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - PaymentView
//extension ModuleContainer {
//    func getPaymentView() -> any View {
//        let view = PaymentView()
//        let viewModel = PaymentViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - CategoryView
//extension ModuleContainer {
//    func getCategoryView() -> any View {
//        let view = CategoryView()
//        let viewModel = CategoryViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}

// MARK: - ProfileView
//extension ModuleContainer {
//    func getProfileView() -> any View {
//        let view = ProfileView()
//        let viewModel = ProfileViewModel(dependencies)
//        view.viewModel = viewModel
//        return view
//    }
//}
