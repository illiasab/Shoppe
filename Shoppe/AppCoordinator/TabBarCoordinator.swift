//
//  MainCoordinator.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.

import UIKit
import SwiftUI

protocol TabBarCoordinatorProtocol: Coordinator {
    func start()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tabBar }
    var dependencies: IDependencies
    var userDefaultsRepository: IUserDefaultsRepository
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }

    func start() {
        if userDefaultsRepository.getAllCategoriesViewTapped() == true {
            showAllCategoriesView()
        }  else {
                 showTabBar()
            }
    }

    private func showTabBar() {
        let tabBarView = TabBarMockAssembly.configure(dependencies)
        
        guard let tabBarView = tabBarView as? TabBarMockView else {
            return
        }
        let hostingController = UIHostingController(rootView: AnyView(tabBarView))
        navigationController.setViewControllers([hostingController], animated: true)
    }

    private func showAllCategoriesView() {
        let allCategoriesView = AllCategoriesAssembly.configure(dependencies)
        
        guard let allCategoriesView = allCategoriesView as? AllCategoriesView else {
            return
        }

        let hostingController = UIHostingController(rootView: AnyView(allCategoriesView))
        navigationController.pushViewController(hostingController, animated: true)
    }

    private func navigateBackToTabBar() {
        navigationController.popViewController(animated: true)
    }
}

