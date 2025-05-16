//
//  CharacterModel.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

enum CharacterStatus: String {
    case alive, dead, unknown
    
    init?(string: String) {
        self.init(rawValue: string.lowercased())
    }
    
    var title: String {
        rawValue.capitalized
    }
}

enum CharacterGender: String {
    case female, male, genderless, unknown
    
    init?(string: String) {
        self.init(rawValue: string.lowercased())
    }
    
    var title: String {
        rawValue.capitalized
    }
}

struct CharacterModel: Identifiable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let gender: CharacterGender
    let image: URL?
}
