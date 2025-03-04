//
//  SignUpAssembly.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

final class SignUpAssembly {
    static func configure(_ dependencies: IDependencies) -> any View {
        return dependencies.moduleContainer.getSignUpView()
    }
}
