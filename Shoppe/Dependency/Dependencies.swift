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
    var alertBuilder: IAlertsBuilder { get }
    var authService: IAuthService { get }
    var myProductService: IProductService { get }
    var cartService: ICartService { get }
}


final class Dependencies: IDependencies, ObservableObject{
    lazy var moduleContainer: IModuleContainer = ModuleContainer(self)
    lazy var userDefaultsRepository: IUserDefaultsRepository = UserDefaultsRepository(container: UserDefaults.standard)
    lazy var networkService:IHTTPClient = HTTPClient()
    lazy var alertBuilder: IAlertsBuilder = AlertsBuilder()
    lazy var authService: IAuthService = AuthService(dependencies: self)
    lazy var myProductService: IProductService = ProductService(self)
    lazy var cartService: ICartService = CartService(self)
}
