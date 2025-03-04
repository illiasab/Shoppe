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

final class AppCoordinator: AppCoordinatorProtocol, ObservableObject {
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
        launchCoordinator.start()
        childCoordinators.append(launchCoordinator)
    }

    func showOnboardingFlow() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController, dependencies: dependencies)
        onboardingCoordinator.finishDelegate = self
        onboardingCoordinator.start()
        childCoordinators.append(onboardingCoordinator)
    }

    func showAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController, dependencies: dependencies)
        authCoordinator.finishDelegate = self
        authCoordinator.onAuthSuccess = { [weak self] in
            self?.showMainFlow()
        }
        authCoordinator.start()
        childCoordinators.append(authCoordinator)
    }

    func showMainFlow() {
        let mainCoordinator = MainCoordinator(navigationController, dependencies: dependencies)
        mainCoordinator.finishDelegate = self
        mainCoordinator.start()
        childCoordinators.append(mainCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0.type != childCoordinator.type }
        
        switch childCoordinator.type {
        case .launch:
            showOnboardingFlow()
        case .onboarding:
            userDefaultsRepository.setOnboardingComplete()
            showAuthFlow()
        case .auth:
            showMainFlow()
        default:
            break
        }
    }
}

