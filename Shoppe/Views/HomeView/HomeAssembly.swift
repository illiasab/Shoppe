//
//  HomeAssembly.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

final class HomeAssembly {
    static func configure(_ dependencies: IDependencies) -> any View {
        return  dependencies.moduleContainer.getHomeView()
    }
}

