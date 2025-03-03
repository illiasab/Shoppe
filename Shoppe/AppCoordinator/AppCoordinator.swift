//
//  AppCoordinator.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//
import UIKit


protocol AppCoordinatorProtocol: Coordinator {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    private let userDefaultsRepository: IUserDefaultsRepository
    var dependencies: IDependencies
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
        self.dependencies = dependencies
        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }
    
    func start() {
        showLaunchFlow()
    }
    
    func showLaunchFlow() {
        let launchCoordinator = LaunchCoordinator(navigationController, dependencies: dependencies)
        launchCoordinator.finishDelegate = self
        if userDefaultsRepository.isOnboardingCompleteBefore {
            launchCoordinator.start()
        } else {
            launchCoordinator.startFirstLaunch()
        }
        childCoordinators.append(launchCoordinator)
    }
    
//    func showOnboardingFlow() {
//        let onboardingCoordinator = OnboardingCoordinator(navigationController, dependencies: dependencies)
//        onboardingCoordinator.finishDelegate = self
//        onboardingCoordinator.start()
//        childCoordinators.append(onboardingCoordinator)
//    }
    
//    func showMainFlow() {
//        let mainCoordinator = MainCoordinator(navigationController, dependencies: dependencies)
//        mainCoordinator.finishDelegate = self
//        mainCoordinator.start()
//        childCoordinators.append(mainCoordinator)
//    }
    
//    func showAuthFlow() {
//        let authCoordinator = AuthCoordinator(navigationController, dependencies: dependencies)
//        authCoordinator.finishDelegate = self
//        childCoordinators.append(authCoordinator)
//        
//        if userDefaultsRepository.isRegistredUserBefore {
//               authCoordinator.start()
//        } else if userDefaultsRepository.isNotUserYet{
//               authCoordinator.startRegister()
//           }
//    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .launch:
            if userDefaultsRepository.isOnboardingCompleteBefore {
//                showMainFlow()
            } else {
//                showOnboardingFlow()
            }
        case .onboarding:
            userDefaultsRepository.setOnboardingComplete()
//            showAuthFlow()
        case .app, .main: break
        case .auth:
            if userDefaultsRepository.isRegistredUserBefore && userDefaultsRepository.isAuthenticatedUser {
//                showMainFlow()
            } else if userDefaultsRepository.isRegistredUserBefore && !userDefaultsRepository.isAuthenticatedUser  {
//                showAuthFlow()
            } else {
//                showAuthFlow()
            }
        }
    }
}
