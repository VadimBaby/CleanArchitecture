//
//  CleanArchitectureApp.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import SwiftUI
import Network
import Swinject

@main
struct CleanArchitectureApp: App {
    let resolver: Resolver
    
    init() {
        self.resolver = DIConfigurator.configure(
            with: [NetworkAssembly(), RepositoriesAssembly(), DomainAssembly()]
        )
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(viewModel: HomeAssembly.viewModel(resolver: resolver), resolver: resolver)
            }
        }
    }
}
