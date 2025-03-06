//
//  MainCoordinator.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.

import UIKit
import SwiftUI

protocol MainCoordinatorProtocol: Coordinator {
    func start()
}

final class MainCoordinator: MainCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .main }
    var dependencies: IDependencies
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showHomeView()
    }
    
    private func showHomeView() {
        let homeView = HomeAssembly.configure(dependencies)
        let hostingController = UIHostingController(rootView: AnyView(homeView))
        
        
        navigationController.setViewControllers([hostingController], animated: true)
    }
}
