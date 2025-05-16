//
//  File.swift
//  Network
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

public struct ServerCharacterModel: Decodable {
    public let id: Int?
    public let name: String?
    public let status: String?
    public let species: String?
    public let gender: String?
    public let image: String?
}
