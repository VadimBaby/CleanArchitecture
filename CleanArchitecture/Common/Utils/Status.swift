//
//  Status.swift
//  CleanArchitecture
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

enum Status: Equatable {
    static func == (lhs: Status, rhs: Status) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading),
             (.loaded, .loaded):
            return true
            
        case let (.error(lhsError), .error(rhsError)):
            let nsError1 = lhsError as NSError
            let nsError2 = rhsError as NSError
            return nsError1 == nsError2
            
        default:
            return false
        }
    }
    
    case loading, loaded, error(error: Error)
}
