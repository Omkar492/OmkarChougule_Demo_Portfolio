//
//  HoldingsViewController.swift
//  OmkarChougule_Demo_Portfolio
//
//  Created by Omkar Chougule on 22/01/25.
//

import UIKit

protocol HoldingsViewControllerProtocol: UIViewController {
    init(viewModel: HoldingsViewModelProtocol)
}

final class HoldingsViewController: UIViewController, HoldingsViewControllerProtocol {
    // MARK: Constants
    private struct Constants {
        static let cellIdentifier: String = "HoldingCellIdentifier"
        static let navigationItemTitle = "Portfolio"
    }

    // MARK: Initializers
    required init(viewModel: HoldingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }

    // MARK: Private Methods
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var loadingView: LoadingView = LoadingView()

    private lazy var expandableBottomView: InvestmentBottomView = {
        let view = InvestmentBottomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    private var viewModel: HoldingsViewModelProtocol?
    private var expandableHeightConstraint: NSLayoutConstraint?
    private var bottomViewState: BottomViewState = .collapsed {
        didSet {
            expandableBottomView.viewState = bottomViewState
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Show the loading view until API response is fetched
        view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
        setupViewModelBindings()
        setupViewBindings()
        fetchData()
        setConstraints()
        showLoadingScreen()
    }

    deinit {
        print("deinit called for :\(String(describing: self))")
    }
}

// MARK: Private Methods
private extension HoldingsViewController {
    func setupViewModelBindings() {
        viewModel?.updateUI = {
            DispatchQueue.main.async { [weak self] in
                guard let self, let viewModel = self.viewModel else { return }
                self.hideLoadingScreen()
                self.expandableBottomView.holdings = viewModel.holdings
                self.tableView.reloadData()
            }
        }
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = Constants.navigationItemTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = UIColor.navyBlue
    }
    
    func setupViewBindings() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bottomViewTapped))
        expandableBottomView.addGestureRecognizer(tapGesture)
    }
    
    func fetchData() {
        viewModel?.fetchHoldings()
    }
    
    func showLoadingScreen() {
        loadingView.show(in: self.view)
    }
    
    func hideLoadingScreen() {
        loadingView.hide()
    }

    func setupTableView() {
        tableView.register(HoldingCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setConstraints() {
        view.addSubview(tableView)
        view.addSubview(expandableBottomView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: expandableBottomView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            expandableBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expandableBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            expandableBottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        expandableHeightConstraint = expandableBottomView
            .heightAnchor
            .constraint(equalToConstant: bottomViewState.viewHeight)
        expandableHeightConstraint?.isActive = true
    }
    
    @objc
    func bottomViewTapped() {
        bottomViewState.toggle()
        expandableHeightConstraint?.constant = bottomViewState.viewHeight
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let self else { return }
            self.view.layoutIfNeeded()
        })
    }
}

extension HoldingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.userHoldings.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier,
                                                    for: indexPath) as? HoldingCell,
           let holding = viewModel?.userHoldings[safe: indexPath.row] {
            cell.updateData(holding)
            return cell
        }
        return UITableViewCell()
    }
}
