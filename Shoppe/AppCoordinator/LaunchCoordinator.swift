//
//  LaunchCoordinator.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//
import UIKit
import SwiftUI

protocol LaunchCoordinatorProtocol: Coordinator {
    func start()
    func startFirstLaunch()
}

final class LaunchCoordinator: LaunchCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: IDependencies
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showLaunchViewController(isShowOnboardingBefore: true)
    }
    
    func startFirstLaunch() {
        showLaunchViewController(isShowOnboardingBefore: false)
    }
    
    func showLaunchViewController(isShowOnboardingBefore: Bool = false) {
        let launchView = LaunchAssembly.configure(dependencies)
        
        guard var launchView = launchView as? LaunchView else { return }

        let hostingController = UIHostingController(rootView: launchView)

        launchView.isShowOnboardingBefore = isShowOnboardingBefore

        launchView.didSendEventHandler = { [weak self] event in
            switch event {
            case .launchComplete:
                self?.finish()
            }
        }
        
        navigationController.pushViewController(hostingController, animated: true)
    }
}
