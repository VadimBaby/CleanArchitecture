//
//  Int.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

extension Optional where Wrapped == Int {
    var orZero: Int {
        self ?? .zero
    }
}

extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }
}
