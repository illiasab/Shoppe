//
//  ContentView.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dependencies: Dependencies
    
    @State private var appCoordinator: AppCoordinatorProtocol?
    
    var body: some View {
        NavigationView {

            
            EmptyView()
                .onAppear {
                    if appCoordinator == nil {
                        let navigationController = UINavigationController()
                        appCoordinator = AppCoordinator(navigationController, dependencies: dependencies)
                        appCoordinator?.start()
                    }
                }
        }
    }
}

