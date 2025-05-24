//
//  DIConfigurator.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 24.05.2025.
//

import Swinject

class DIConfigurator {
    static func configure(with assemblies: [any Assembly]) -> Resolver {
        let container = Container()
        let assembler = Assembler(assemblies, container: container)
        return assembler.resolver
    }
}
