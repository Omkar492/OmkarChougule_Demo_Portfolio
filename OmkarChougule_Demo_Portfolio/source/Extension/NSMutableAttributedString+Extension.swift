//
//  NSMutableAttributedString+Extension.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    func appendIcon(_ iconName: String) {
        let textAttachment = NSTextAttachment()
        textAttachment.image = UIImage(named: iconName)
        textAttachment.bounds = CGRect(x: 0, y: 0, width: 12, height: 12)
        append(.init(string: " "))
        append(.init(attachment: textAttachment))
    }
}
