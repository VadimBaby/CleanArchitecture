//
//  CharacterService.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

enum CharactersSort {
    case none, byName
    
    func sorted(characters: [CharacterModel]) -> [CharacterModel] {
        switch self {
        case .none:
            return characters
        case .byName:
            return characters.sorted(by: { $0.name > $1.name })
        }
    }
}

/// Класс, который работает с персонажами
final class CharacterService: CharacterUseCase {
    private var maxPage: Int? = nil
    private var currentPage: Int? = nil
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository) {
        self.repository = repository
    }
    
    func getCharacter(
        by id: Int,
        completion: @escaping (_ result: Result<CharacterModel, Error>) -> Void
    ) {
        repository.getCharacter(by: id, completion: completion)
    }
    
    func getAllCharacters(
        sort: CharactersSort,
        completion: @escaping (_ result: Result<[CharacterModel], Error>) -> Void
    ) {
        getAllCharactersByPage(sort: sort, completion: completion)
    }
    
    func getNextPage(
        sort: CharactersSort,
        completion: @escaping (_ result: Result<[CharacterModel], Error>) -> Void
    ) {
        guard let currentPage,
              let maxPage,
              currentPage < maxPage else { completion(.failure(URLError(.badServerResponse))); return }
        
        let nextPage = currentPage + 1
        
        getAllCharactersByPage(nextPage, sort: sort, completion: completion)
    }
}

// MARK: - Private Methods

private extension CharacterService {
    func getAllCharactersByPage(
        _ page: Int = 1,
        sort: CharactersSort,
        completion: @escaping (_ result: Result<[CharacterModel], Error>) -> Void
    ) {
        repository.getAllCharacters(page: page) { [weak self] result in
            switch result {
            case .success(let response):
                self?.currentPage = page
                self?.maxPage = response.info.pages
                let sorted = sort.sorted(characters: response.results)
                completion(.success(sorted))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
