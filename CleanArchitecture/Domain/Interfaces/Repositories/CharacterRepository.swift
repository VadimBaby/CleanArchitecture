//
//  CharacterRepository.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

/// Абстракция для классов, которые предоставляет данные о персонажах
protocol CharacterRepository: AnyObject {
    func getAllCharacters(
        page: Int,
        completion: @escaping (_ result: Result<ResponseModel<[CharacterModel]>, Error>) -> Void
    )
    func getCharacter(by id: Int, completion: @escaping (_ result: Result<CharacterModel, Error>) -> Void)
}
