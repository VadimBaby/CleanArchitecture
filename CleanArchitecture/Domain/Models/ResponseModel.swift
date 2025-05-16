//
//  Response.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

struct ResponseModel<T> {
    let info: InfoModel
    let results: T
}

struct InfoModel {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
