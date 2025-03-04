//
//  HomeViewModel.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/3/25.
//

import SwiftUI

protocol HomeViewModelDelegate {
    
}
final class HomeViewModel: HomeViewModelDelegate {
    private var networkingService: IHTTPClient?
    private var userDefaultsRepository: IUserDefaultsRepository?
    
    init(_ dependencies: IDependencies) {
        networkingService = dependencies.networkService
        userDefaultsRepository = dependencies.userDefaultsRepository
    }
}
