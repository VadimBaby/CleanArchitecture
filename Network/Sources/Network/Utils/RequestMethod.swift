//
//  File.swift
//  Network
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

public enum RequestMethod: String {
    case get, post, put, delete
    
    public var value: String {
        rawValue.uppercased()
    }
}
