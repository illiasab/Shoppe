////
////  HomeCoordinator.swift
////  Shoppe
////
////  Created by Ylyas Abdywahytow on 3/7/25.
////
//
//import UIKit
//import SwiftUI
//
//
//
//protocol HomeCoordinatorProtocol: Coordinator {
//    func start()
//}
//final class HomeCoordinator: TabBarCoordinatorProtocol {
//    weak var finishDelegate: CoordinatorFinishDelegate?
//    var navigationController: UINavigationController
//    var childCoordinators: [Coordinator] = []
//    var type: CoordinatorType { .tabBar }
//    var dependencies: IDependencies
//    
//    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
//        self.navigationController = navigationController
//        self.dependencies = dependencies
//    }
//    
//    func start() {
//        showHomeView()
//    }
//    
//    func showHomeView() {
//        var homeView = HomeAssembly.configure(dependencies)
//        homeView.AllCategoriesTapped = { [weak self] in
//            self?.showAllCategoriesView()
//        }
//        let hostingController = UIHostingController(rootView: AnyView(homeView))
//        navigationController.pushViewController(hostingController, animated: true)
//    }
//    
//    func showAllCategoriesView() {
//        var allCategoriesView = AllCategoriesAssembly.configure(dependencies)
//           
//           allCategoriesView.didCategoryEventHandler = { [weak self]  (event: categoryEvent) in
//               switch event {
//               case .backButtonTapped:
//                   self?.navigationController.popViewController(animated: true)
//               }
//           }
//           
//           // Create a hosting controller and push the view
//           let hostingController = UIHostingController(rootView: AnyView(allCategoriesView))
//           navigationController.pushViewController(hostingController, animated: true)
//       }
//}
