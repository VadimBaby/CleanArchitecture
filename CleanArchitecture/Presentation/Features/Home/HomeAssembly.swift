//
//  HomeAssembly.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import SwiftUI
import Network

/// Данный класс занимается сборкой useCase'а для HomeView
final class HomeAssembly {
    
    // MARK: - Repository и UseCase'ы желательно хранить в DI Контейнере (https://github.com/Swinject/Swinject) просто не знаю, будут ли это смотреть и стоит ли так заморачиваться
    
    static func useCase() -> CharacterUseCase {
        let networkAPI = NetworkAPIFactory.create()
        let repository: CharacterRepository = CharacterNetworkStorage(networkAPI: networkAPI)
        let useCase: CharacterUseCase = CharacterService(repository: repository)
        return useCase
    }
}
