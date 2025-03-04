//
//  ShoppeApp.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//

import SwiftUI

@main
struct ShoppeApp: App {
    @StateObject var dependencies = Dependencies()

    var body: some Scene {
        WindowGroup {
            CoordinatorView(dependencies: dependencies)
                .edgesIgnoringSafeArea(.all)
        }
    }
}








