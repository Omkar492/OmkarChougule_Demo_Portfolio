//
//  ResolverProtocol.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//


protocol ResolverProtocol {
    func getHoldingsViewController() -> HoldingsViewControllerProtocol
}

struct Resolver: ResolverProtocol {
    func getHoldingsViewController() -> HoldingsViewControllerProtocol {
        HoldingsViewController(viewModel: getHoldingViewModel())
    }

    private func getHoldingViewModel() -> HoldingsViewModelProtocol {
        HoldingsViewModel(getHoldingsUseCase: getHoldingUseCase())
    }

    private func getHoldingUseCase() -> GetHoldingUseCase {
        GetHoldingUseCaseImpl(repository: getHoldingRepository())
    }

    private func getHoldingRepository() -> HoldingsRepository {
        HoldingsRepositoryImpl(networkManager: getNetworkManager())
    }

    private func getNetworkManager() -> NetworkManagerProtocol {
        NetworkManagerImpl.shared
    }
}
