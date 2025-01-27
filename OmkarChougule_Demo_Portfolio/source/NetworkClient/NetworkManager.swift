//
//  NetworkManager.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation

enum NetworkError: Error {
    case statusCodeError(statusCode: Int)
    case decodingError
    case urlError
    case otherError(error: Error?)
}

protocol NetworkManagerProtocol {
    func execute<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

final class NetworkManagerImpl: NetworkManagerProtocol {
    static let shared: NetworkManagerProtocol = NetworkManagerImpl()
    private let decoder = JSONDecoder()
    private init() { }

    func execute<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkError.urlError
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.statusCodeError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }

        return try decoder.decode(T.self, from: data)
    }
}
