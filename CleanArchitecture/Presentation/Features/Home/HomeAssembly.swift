//
//  HomeAssembly.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import SwiftUI
import Swinject
import Network

/// Данный класс занимается сборкой useCase'а для HomeView
final class HomeAssembly {
    static func viewModel(resolver: Resolver) -> HomeViewModel {
        let viewModel = HomeViewModel(useCase: resolver.resolve(CharacterUseCase.self)!)
        return viewModel
    }
    
    static func mockViewModel() -> HomeViewModel {
        let network = BaseNetworkService()
        let networkAPI = NetworkAPIService(network: network)
        let repository = CharacterNetworkStorage(networkAPI: networkAPI)
        let useCase = CharacterService(repository: repository)
        let viewModel = HomeViewModel(useCase: useCase)
        return viewModel
    }
}
