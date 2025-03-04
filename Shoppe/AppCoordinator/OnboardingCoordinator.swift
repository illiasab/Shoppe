//
//  OnboardingCoordinator.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//
import UIKit
import SwiftUI

protocol OnboardingCoordinatorProtocol: Coordinator {
    func start()
}

final class OnboardingCoordinator: OnboardingCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .onboarding }
    var dependencies: IDependencies
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showOnboardingViewController()
    }
    
    func showOnboardingViewController() {
        let onboardingView = OnboardingAssembly.configure(dependencies)
        var hostingController: UIHostingController<OnboardingView>? = nil

        if var onboardView = onboardingView as? OnboardingView {
            hostingController = UIHostingController(rootView: onboardView)
            
            onboardView.didSendEventHandler = { [weak self] event in
                switch event {
                case .onboardingComplete:
                    self?.finish()
                }
            }
        }
        if let hostingController = hostingController {
            navigationController.pushViewController(hostingController, animated: false)
        }
    }
}

