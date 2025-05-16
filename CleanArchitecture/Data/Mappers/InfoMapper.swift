//
//  InfoMapper.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Network

struct InfoMapper {
    static func toLocal(from serverEntity: ServerInfoModel) -> InfoModel {
        return InfoModel(
            count: serverEntity.count.orZero,
            pages: serverEntity.pages.orZero,
            next: serverEntity.next,
            prev: serverEntity.prev
        )
    }
}
