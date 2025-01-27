//
//  UIColor+Extension.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import UIKit

extension UIColor {
    enum Text {
        static let charcoal: UIColor = UIColor.charcoal
        static let grey: UIColor = UIColor.gray
        static let black: UIColor = UIColor.black
        static let profit: UIColor = UIColor.profitGreen
        static let loss: UIColor = UIColor.lossRed
    }

    static let navyBlue: UIColor = UIColor(red: 0.0, green: 0.23, blue: 0.56, alpha: 1.0)
    private static let charcoal: UIColor = UIColor(red: 22 / 255.0, green: 22 / 255.0, blue: 22 / 255.0, alpha: 1)
    private static let profitGreen: UIColor = UIColor(red: 0.0, green: 0.6, blue: 0.0, alpha: 1.0)
    private static let lossRed: UIColor = UIColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 1.0)
}
