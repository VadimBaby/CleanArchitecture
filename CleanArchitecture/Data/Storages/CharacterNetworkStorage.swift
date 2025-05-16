//
//  CharacterStorage.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Network
import Foundation

/// Класс, который берет данные об персонажах из сети
final class CharacterNetworkStorage: CharacterRepository {
    private let networkAPI: NetworkAPI
    
    init(networkAPI: NetworkAPI) {
        self.networkAPI = networkAPI
    }
    
    func getAllCharacters(
        page: Int = 1,
        completion: @escaping (_ result: Result<ResponseModel<[CharacterModel]>, Error>) -> Void
    ) {
        Task {
            do {
                let serverResponse = try await networkAPI.allCharacters(page: page)
                let response = ResponseMapper.toLocal(from: serverResponse)
                completion(.success(response))
            } catch {
                debugPrint(error)
                completion(.failure(error))
            }
        }
    }
    
    func getCharacter(
        by id: Int,
        completion: @escaping (_ result: Result<CharacterModel, Error>) -> Void
    ) {
        Task {
            do {
                let serverCharacter = try await networkAPI.character(id: id)
                
                guard let character = CharacterMapper.toLocal(from: serverCharacter) else { throw URLError(.badServerResponse) }
                
                completion(.success(character))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
