//
//  ResponseMapper.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Network

struct ResponseMapper {
    static func toLocal(
        from serverEntity: ServerResponseModel<[ServerCharacterModel]>
    ) -> ResponseModel<[CharacterModel]> {
        let info = InfoMapper.toLocal(from: serverEntity.info)
        let results = serverEntity.results.compactMap { CharacterMapper.toLocal(from: $0) }
        
        return .init(info: info, results: results)
    }
}
