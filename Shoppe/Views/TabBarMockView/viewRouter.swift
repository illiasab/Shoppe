//
//  viewRouter.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/7/25.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentTab: Tab = .home

}

enum Tab {
    case home, favorites, categories, carts, profile
}
