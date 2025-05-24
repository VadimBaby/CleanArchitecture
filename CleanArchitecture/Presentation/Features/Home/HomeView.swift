//
//  HomeView.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import SwiftUI
import UIKitLibrary
import Swinject

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    
    private let resolver: Resolver
    
    init(viewModel: HomeViewModel, resolver: Resolver) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.resolver = resolver
    }
    
    
    var body: some View {
        Group {
            switch viewModel.status {
            case .loading:
                ProgressView()
            case .loaded:
                content(characters: viewModel.characters)
            case .error(let error):
                ErrorView(error: error)
            }
        }
        .navigationTitle("Персонажи")
        .onAppear(perform: viewModel.onAppear)
    }
}

// MARK: - Subviews

private extension HomeView {
    @ViewBuilder func content(characters: [CharacterModel]) -> some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(characters) { character in
                    CharacterCardView(
                        name: character.name,
                        status: character.status.title,
                        species: character.species,
                        gender: character.gender.title,
                        imageURL: character.image
                    )
                }
                
                if viewModel.paginationStatus == .loaded {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 1)
                        .onAppear(perform: viewModel.paginationAppear)
                } else if viewModel.paginationStatus == .loading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
        }
        .background(Color.systemGray.ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        HomeView(viewModel: HomeAssembly.mockViewModel(), resolver: Container())
    }
}
