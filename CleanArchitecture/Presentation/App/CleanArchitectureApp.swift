//
//  CleanArchitectureApp.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import SwiftUI
import Network

@main
struct CleanArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(useCase: HomeAssembly.useCase())
            }
        }
    }
}
