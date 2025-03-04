//
//  CoordinatorView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/4/25.
//


import SwiftUI
import UIKit

struct CoordinatorView: UIViewControllerRepresentable {
    let dependencies: IDependencies

    class Coordinator {
        var appCoordinator: AppCoordinator?

        init(dependencies: IDependencies) {
            let navigationController = UINavigationController()
            self.appCoordinator = AppCoordinator(navigationController, dependencies: dependencies)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(dependencies: dependencies)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let navigationController = context.coordinator.appCoordinator!.navigationController
        context.coordinator.appCoordinator!.start()
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
