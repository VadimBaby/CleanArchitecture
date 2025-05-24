//
//  RepositoriesAssembly.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 24.05.2025.
//

import Swinject
import Network

class RepositoriesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CharacterRepository.self) { resolver in
            CharacterNetworkStorage(networkAPI: resolver.resolve(NetworkAPI.self)!)
        }
    }
}
