//
//  HoldingRouter.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation

import UIKit

protocol HoldingRouterProtocol {
    init(window: UIWindow?, resolver: ResolverProtocol)
    func presentFirstScreen()
}

final class HoldingRouter: HoldingRouterProtocol {
    private weak var window: UIWindow?
    private let resolver: ResolverProtocol
    required init(window: UIWindow?, resolver: ResolverProtocol = Resolver()) {
        self.window = window
        self.resolver = resolver
    }

    func presentFirstScreen() {
        let viewController = resolver.getHoldingsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    deinit {
        print("deinit called for :\(String(describing: self))")
    }
}
