//
//  UIStackView+Extension.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import UIKit

extension UIStackView {
    func setup(_ axis: NSLayoutConstraint.Axis = .vertical,
               _ spacing: CGFloat = 8) {
        translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing
        alignment = .fill
    }

    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
