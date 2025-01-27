//
//  GetHoldingUseCase.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation

protocol GetHoldingUseCase {
    init(repository: HoldingsRepository)
    func execute() async throws -> Holdings
}

struct GetHoldingUseCaseImpl: GetHoldingUseCase {
    private let repository: HoldingsRepository

    init(repository: HoldingsRepository) {
        self.repository = repository
    }

    func execute() async throws -> Holdings {
        try await repository.getHoldings()
    }
}
