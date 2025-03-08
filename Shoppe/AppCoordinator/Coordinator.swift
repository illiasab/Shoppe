//
//  Coordinator.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//
import UIKit

enum CoordinatorType {
    case app, launch, auth, onboarding, tabBar
}
protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    var dependencies: IDependencies { get }
    func start()
    func finish()
}

extension Coordinator {
    func finish() {
        print("🛑 Завершаем LaunchCoordinator")
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator:self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
