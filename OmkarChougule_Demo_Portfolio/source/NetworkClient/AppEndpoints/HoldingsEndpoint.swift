//
//  HoldingsEndpoint.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation

enum HoldingsEndpoint: Endpoint {
    private struct Constants {
        static let holdingsUrl: String = "https://35dee773a9ec441e9f38d5fc249406ce.api.mockbin.io/"
    }

    case holdings

    var url: URL? {
        switch self {
        case .holdings:
            return URL(string: Constants.holdingsUrl)
        }
    }

    var method: HTTPMethod {
        switch self {
        case .holdings:
            return .get
        }
    }

    var headers: [String : String] {
        switch self {
        case .holdings:
            return [:]
        }
    }

    var body: Data? {
        switch self {
        case .holdings:
            return nil
        }
    }

}
