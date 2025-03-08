//
//  ShoppeApp.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//

import SwiftUI
import Firebase
@main
struct ShoppeApp: App {
    
    @StateObject var dependencies = Dependencies()

    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView(dependencies: dependencies)
                .edgesIgnoringSafeArea(.all)
        }
    }
}








