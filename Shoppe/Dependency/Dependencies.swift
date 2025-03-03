//
//  Dependencies.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/2/25.
//

import Foundation
import SwiftUI

protocol IDependencies {
    var moduleContainer: IModuleContainer { get }
    var userDefaultsRepository: IUserDefaultsRepository { get }
    var networkService: IHTTPClient { get }
    
}


final class Dependencies: IDependencies {
    lazy var moduleContainer: IModuleContainer = ModuleContainer(self)
    lazy var userDefaultsRepository: IUserDefaultsRepository = UserDefaultsRepository(container: UserDefaults.standard)
    lazy var networkService:IHTTPClient = HTTPClient()
}
