//
//  HomeViewModel.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published private(set) var characters: [CharacterModel] = []
    @Published private(set) var status: Status = .loading
    @Published private(set) var paginationStatus: Status = .loaded
    
    private let useCase: CharacterUseCase
    
    init(useCase: CharacterUseCase) {
        self.useCase = useCase
    }
    
    func onAppear() {
        self.status = .loading
        
        useCase.getAllCharacters(sort: .byName) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let characters):
                    self?.characters = characters
                    self?.status = .loaded
                case .failure(let error):
                    self?.status = .error(error: error)
                }
            }
        }
    }
    
    func paginationAppear() {
        self.paginationStatus = .loading
        
        useCase.getNextPage(sort: .byName) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let characters):
                    self?.characters.append(contentsOf: characters)
                    self?.paginationStatus = .loaded
                case .failure(let error):
                    self?.paginationStatus = .error(error: error)
                }
            }
        }
    }
 }
