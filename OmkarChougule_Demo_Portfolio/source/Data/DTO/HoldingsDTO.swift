//
//  HoldingsDTO.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation

struct DataDTO: Decodable {
    let data: HoldingsDTO
    
    func toDomain() -> Holdings {
        data.toDomain()
    }
}
// MARK: - HoldingsDTO
struct HoldingsDTO: Decodable {
    let userHolding: [UserHoldingDTO]

    func toDomain() -> Holdings {
        let userholdings = userHolding.map { $0.toDomain() }
        return .init(userHoldings: userholdings.sorted { $0.symbol.compare($1.symbol) == .orderedAscending })
    }
}

// MARK: - UserHoldingDTO
struct UserHoldingDTO: Decodable {
    let symbol: String
    let quantity: Int
    let ltp: Double
    let avgPrice: Double
    let close: Double
    
    func toDomain() -> UserHolding {
        return .init(
            symbol: symbol,
            quantity: quantity,
            ltp: ltp,
            avgPrice: avgPrice,
            close: close
        )
    }
}
