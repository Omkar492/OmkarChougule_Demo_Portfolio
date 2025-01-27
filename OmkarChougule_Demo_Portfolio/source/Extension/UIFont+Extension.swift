//
//  UIFont+Extension.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import UIKit

extension UIFont {
    enum CellHeading {
        static var regular: UIFont = UIFont.boldSystemFont(ofSize: 18)
        static var medium: UIFont = UIFont.systemFont(ofSize: 15)
    }

    enum CellSubHeading {
        static var regular: UIFont = UIFont.systemFont(ofSize: 15)
    }
    enum BottomHeading {
        static var regular: UIFont = UIFont.systemFont(ofSize: 15, weight: .medium)
    }
}
