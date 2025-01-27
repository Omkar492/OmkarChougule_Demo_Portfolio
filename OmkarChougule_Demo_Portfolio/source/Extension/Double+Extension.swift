//
//  Double+Extension.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//


extension Double {
    var rupeesValue: String {
        var format = "₹%.2f"
        if isNegative {
            format = "-₹%.2f"
        }
        return String(format: format, abs(self))
    }

    var isNegative: Bool {
        self < 0
    }
}
