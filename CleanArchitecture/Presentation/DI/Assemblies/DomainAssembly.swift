//
//  DomainAssembly.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 24.05.2025.
//

import Swinject

class DomainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CharacterUseCase.self) { resolver in
            CharacterService(repository: resolver.resolve(CharacterRepository.self)!)
        }
    }
}
