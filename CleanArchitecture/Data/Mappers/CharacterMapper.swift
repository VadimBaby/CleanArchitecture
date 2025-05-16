//
//  CharacterMapper.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Network
import Foundation

struct CharacterMapper {
    static func toLocal(from serverEntity: ServerCharacterModel) -> CharacterModel? {
        guard let id = serverEntity.id,
              let status = CharacterStatus(string: serverEntity.status.orEmpty),
              let gender = CharacterGender(string: serverEntity.gender.orEmpty) else { return nil }
        
        return CharacterModel(
            id: id,
            name: serverEntity.name.orEmpty,
            status: status,
            species: serverEntity.species.orEmpty,
            gender: gender,
            image: URL(string: serverEntity.image.orEmpty)
        )
    }
}
