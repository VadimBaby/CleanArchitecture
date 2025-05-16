//
//  File.swift
//  Network
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

public struct ServerResponseModel<T: Decodable>: Decodable {
    public let info: ServerInfoModel
    public let results: T
}

public struct ServerInfoModel: Decodable {
    public let count: Int?
    public let pages: Int?
    public let next: String?
    public let prev: String?
}
