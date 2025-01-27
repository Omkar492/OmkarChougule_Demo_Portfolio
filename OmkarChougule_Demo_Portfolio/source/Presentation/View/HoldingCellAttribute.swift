//
//  HoldingCellAttribute.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation
import UIKit

enum HoldingCellAttribute {
    case name, ltp, netQty, pnl

    func attributedTitle(_ holding: UserHolding) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString()
        func appendText(_ text: String, attributes: [NSAttributedString.Key: Any]) {
            mutableAttributedString.append(NSAttributedString(string: text, attributes: attributes))
        }
        switch self {
        case .name:
            appendText(holding.symbol, attributes: getValueAttributes(holding))
        case .ltp:
            appendText("LTP: ", attributes: titleAttributes)
            appendText(holding.ltp.rupeesValue, attributes: getValueAttributes(holding))
        case .netQty:
            appendText("NET QTY: ", attributes: titleAttributes)
            appendText("\(holding.quantity)", attributes: getValueAttributes(holding))
        case .pnl:
            appendText("P&L: ", attributes: titleAttributes)
            appendText(holding.pnl.rupeesValue, attributes: getValueAttributes(holding))
        }
        return mutableAttributedString
    }

    private var titleAttributes: [NSAttributedString.Key: Any] {
        [.foregroundColor: UIColor.gray,
         .font: UIFont.CellSubHeading.regular]
    }

    private func getValueAttributes(_ holding: UserHolding) -> [NSAttributedString.Key: Any] {
        switch self {
        case .name:
            return [.font: UIFont.CellHeading.regular]
        case .ltp, .netQty:
            return [.font: UIFont.CellHeading.medium]
        case .pnl:
            return [.font: UIFont.systemFont(ofSize: 15),
                    .foregroundColor: holding.pnl.isNegative ? UIColor.Text.loss : UIColor.Text.profit]
        }
    }
}
