//
//  OmkarChougule_Demo_PortfolioTests.swift
//  OmkarChougule_Demo_PortfolioTests
//
//  Created by Omkar Chougule on 27/01/25.
//

import XCTest
@testable import OmkarChougule_Demo_Portfolio

final class HoldingsViewModelTest: XCTestCase {
    func test_fetchHoldings_WithSuccess() {
        let networkManager = MockNetworkManager(fileName: "holdings_success_response")
        let repository = HoldingsRepositoryImpl(networkManager: networkManager)
        let usecase = GetHoldingUseCaseImpl(repository: repository)
        let viewModel = HoldingsViewModel(getHoldingsUseCase: usecase)
        let expectation = XCTestExpectation(description: "success")
        viewModel.updateUI = {
            expectation.fulfill()
        }
        viewModel.fetchHoldings()
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(viewModel.userHoldings.count, 5)
    }

    func test_fetchHoldings_WithEmpty() {
        let networkManager = MockNetworkManager(fileName: "holdings_empty_response")
        let repository = HoldingsRepositoryImpl(networkManager: networkManager)
        let usecase = GetHoldingUseCaseImpl(repository: repository)
        let viewModel = HoldingsViewModel(getHoldingsUseCase: usecase)
        let expectation = XCTestExpectation(description: "success")
        viewModel.updateUI = {
            expectation.fulfill()
        }
        viewModel.fetchHoldings()
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(viewModel.userHoldings.isEmpty)
    }
    
    func test_fetchHoldings_WithFailure() {
        let networkManager = MockNetworkManager(fileName: "holdings_failure_response")
        let repository = HoldingsRepositoryImpl(networkManager: networkManager)
        let usecase = GetHoldingUseCaseImpl(repository: repository)
        let viewModel = HoldingsViewModel(getHoldingsUseCase: usecase)
        let expectation = XCTestExpectation(description: "success")
        viewModel.updateUI = {
            expectation.fulfill()
        }
        viewModel.fetchHoldings()
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(viewModel.userHoldings.isEmpty)
    }
}
