//
//  AllCategoriesAssembly.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/7/25.
//

import SwiftUI

final class AllCategoriesAssembly {
    static func configure(_ dependencies: IDependencies) -> any View {
        return dependencies.moduleContainer.getAllCategoriesView()
    }
}
