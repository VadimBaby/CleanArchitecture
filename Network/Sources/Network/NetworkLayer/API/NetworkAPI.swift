//
//  File.swift
//  Network
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

/// Абстракция для классов, которые работают с апи Рик и Морти
public protocol NetworkAPI: AnyObject {
    func allCharacters(page: Int) async throws -> ServerResponseModel<[ServerCharacterModel]>
    func character(id: Int) async throws -> ServerCharacterModel
}
