//
//  InvestmentViewAttributes.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation
import UIKit

enum InvestmentViewAttributes {
    case pnl, todayPnl, totalInvestment, currentInvestment

    var attributedTitle: NSMutableAttributedString {
        var string = ""
        switch self {
        case .pnl:
            string = "Profit & Loss "
        case .todayPnl:
            string = "Today's Profit & Loss"
        case .totalInvestment:
            string = "Total Investment"
        case .currentInvestment:
            string = "Current value"
        }
        return NSMutableAttributedString(string: string,
                                         attributes: [.font: UIFont.BottomHeading.regular,
                                                      .foregroundColor: UIColor.Text.charcoal])
    }
    
    func secondLabelAttributeTitle(for holdings: Holdings?) -> NSAttributedString {
        guard let holdings else { return NSAttributedString() }
        var string = ""
        switch self {
        case .pnl:
            string = holdings.totalPNL.rupeesValue
        case .todayPnl:
            string = holdings.totalTodaysPNL.rupeesValue
        case .totalInvestment:
            string = holdings.totalInvestment.rupeesValue
        case .currentInvestment:
            string = holdings.totalCurrentValue.rupeesValue
        }
        return NSAttributedString(string: string,
                                  attributes: getSecondLabelTextAttributes(for: holdings))
    }
    
    private func getSecondLabelTextAttributes(for holdings: Holdings) -> [NSAttributedString.Key: Any]? {
        switch self {
        case .pnl, .todayPnl:
            return [.foregroundColor: holdings.totalTodaysPNL.isNegative ? UIColor.Text.loss : UIColor.Text.profit,
                    .font: UIFont.BottomHeading.regular]
        case .currentInvestment, .totalInvestment:
            return [.font: UIFont.BottomHeading.regular, .foregroundColor: UIColor.Text.charcoal]
        }
    }
}
