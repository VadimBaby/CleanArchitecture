//
//  File.swift
//  Network
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

/// Абстракция для классов, которые предоставляют работу с сетью
public protocol Network: AnyObject {
    func execute(
        path: String,
        method: RequestMethod,
        params: [String: Any]?
    ) async throws -> Data
    
    func configure(with baseURL: String)
}
