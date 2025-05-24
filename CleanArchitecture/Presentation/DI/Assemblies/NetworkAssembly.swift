//
//  NetworkAssembly.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 24.05.2025.
//

import Network
import Swinject

class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Network.self) { _ in
            BaseNetworkService()
        }.inObjectScope(.transient) // resolver.resolve(Network.self) всегда будет возвращать новый экземпляр класса
        
        container.register(NetworkAPI.self) { resolver in
            NetworkAPIService(network: resolver.resolve(Network.self)!)
        }
    }
}
