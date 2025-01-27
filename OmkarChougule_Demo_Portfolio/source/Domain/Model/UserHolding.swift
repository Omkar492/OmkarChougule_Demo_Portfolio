//
//  File.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

// MARK: - UserHolding
struct UserHolding {
    let symbol: String
    let quantity: Int
    let ltp: Double
    let avgPrice: Double
    let close: Double

    var currentValue: Double {
        ltp * Double(quantity)
    }
    var investmentValue: Double {
        avgPrice * Double(quantity)
    }
    var pnl: Double {
        currentValue - investmentValue
    }
    var todayPNL: Double {
        (close - ltp) * Double(quantity)
    }
}
