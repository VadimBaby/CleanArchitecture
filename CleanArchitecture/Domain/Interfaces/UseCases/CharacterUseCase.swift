//
//  CharacterUseCase.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

/// Абстракция для класса, который работает с персонажами
protocol CharacterUseCase: AnyObject {
    func getCharacter(
        by id: Int,
        completion: @escaping (_ result: Result<CharacterModel, Error>) -> Void
    )
    
    func getAllCharacters(
        sort: CharactersSort,
        completion: @escaping (_ result: Result<[CharacterModel], Error>) -> Void
    )
    
    func getNextPage(
        sort: CharactersSort,
        completion: @escaping (_ result: Result<[CharacterModel], Error>) -> Void
    )
}
