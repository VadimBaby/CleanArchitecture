//
//  File.swift
//  Network
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

public final class NetworkAPIFactory {
    public static func create() -> NetworkAPI {
        let network = BaseNetworkService()
        let networkAPI = NetworkAPIService(network: network)
        return networkAPI
    }
}
