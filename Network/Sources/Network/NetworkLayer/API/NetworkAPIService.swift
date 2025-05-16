//
//  File.swift
//  Network
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import Foundation

private struct Constants {
    static let baseURL = "https://rickandmortyapi.com/api"
}

/// Класс, для работы с апи Рик и Морти
public final class NetworkAPIService: NetworkAPI {
    private let network: Network
    
    private enum Endpoint {
        case allCharacters(page: Int), character(id: Int)
        
        var path: String {
            switch self {
            case .allCharacters(page: let page):
                return "character/?page=\(page)"
            case .character(id: let id):
                return "character/\(id)"
            }
        }
        
        var method: RequestMethod {
            .get
        }
        
        var params: [String: Any]? {
            nil
        }
    }
    
    init(network: Network) {
        self.network = network
        self.network.configure(with: Constants.baseURL)
    }
    
    public func allCharacters(page: Int = 1) async throws -> ServerResponseModel<[ServerCharacterModel]> {
        let data = try await fetch(endpoint: .allCharacters(page: page))
        let response = try JSONDecoder().decode(ServerResponseModel<[ServerCharacterModel]>.self, from: data)
        return response
    }
    
    public func character(id: Int) async throws -> ServerCharacterModel {
        let data = try await fetch(endpoint: .character(id: id))
        let response = try JSONDecoder().decode(ServerCharacterModel.self, from: data)
        return response
    }
}

// MARK: - Private Methods

extension NetworkAPIService {
    private func fetch(endpoint: Endpoint) async throws -> Data {
        return try await network.execute(
            path: endpoint.path,
            method: endpoint.method,
            params: endpoint.params
        )
    }
}
