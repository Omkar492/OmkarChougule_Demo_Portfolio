//
//  BottomViewState.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation

enum BottomViewState {
    case collapsed, expanded
    mutating func toggle() {
        self = self == .collapsed ? .expanded : .collapsed
    }
    var viewHeight: CGFloat {
        switch self {
        case .collapsed:
            return 40
        case .expanded:
            return 150
        }
    }
    
    var imageName: String {
        switch self {
        case .collapsed:
            return "upArrow"
        case .expanded:
            return "downArrow"
        }
    }
}
