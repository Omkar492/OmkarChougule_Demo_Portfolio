//
//  HoldingsRepository.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//


protocol HoldingsRepository {
    init(networkManager: NetworkManagerProtocol)
    func getHoldings() async throws -> Holdings
}
