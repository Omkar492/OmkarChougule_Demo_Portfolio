//
//  LoadingView.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 24/01/25.
//

import Foundation
import UIKit

class LoadingView: UIView {
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let messageLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)

        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)

        messageLabel.textColor = .black
        messageLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        messageLabel.text = "Loading..."
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(messageLabel)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            
            messageLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 10),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }

    func show(in view: UIView) {
        view.addSubview(self)
        self.frame = view.bounds
        activityIndicator.startAnimating()
    }

    func hide() {
        activityIndicator.stopAnimating()
        self.removeFromSuperview()
    }
}
