//
//  HoldingCell.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import Foundation
import UIKit

final class HoldingCell: UITableViewCell {

    private struct Constants {
        static let cellSpacing = 16.0
    }
    
    private var data: UserHolding? {
        didSet {
            setupUI()
        }
    }

    lazy private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setup()
        stackView.distribution = .fill
        stackView.spacing = Constants.cellSpacing
        return stackView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func prepareForReuse() {
        data = nil
    }

    func updateData(_ holding: UserHolding) {
        if data == nil {
            data = holding
        }
    }

    private func setupUI() {
        selectionStyle = .none
        mainStackView.removeAllArrangedSubviews()
        getHorizontalStackView().forEach { mainStackView.addArrangedSubview($0) }
        contentView.addSubview(mainStackView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.cellSpacing),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.cellSpacing),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.cellSpacing),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.cellSpacing),
        ])
    }

    private func getHorizontalStackView() -> [UIStackView] {
        return [createStackView(with: [.name, .ltp]),
                createStackView(with: [.netQty, .pnl])]
    }

    private func createStackView(with attributes: [HoldingCellAttribute]) -> UIStackView {
        let stackView = UIStackView()
        stackView.setup(.horizontal)
        stackView.distribution = .equalSpacing
        attributes.compactMap { getLabel($0) }.forEach { stackView.addArrangedSubview($0) }
        return stackView
    }

    private func getLabel(_ attributeType: HoldingCellAttribute) -> UILabel? {
        guard let data else { return nil }
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = attributeType.attributedTitle(data)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }
    
    deinit {
        print("deinit called for :\(String(describing: self))")
    }
}
