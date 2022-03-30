//
//  CountriesListView.swift
//  Travelling
//
//  Created by Cassia Barbosa on 25/03/22.
//

import Foundation
import UIKit

final class CountriesListView: UIView {
    
    var numberOfRowsInSectionAction: (() -> Int)?
    var didSelectRowAtAction: ((ListedCountry) -> Void)?
    var getCountryURL: ((Int) -> URL)?
    var getCountryName: ((Int) -> String)?
    
    private var dataSourceDelegate: CountriesListDataSourceType
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(dataSourceDelegate: CountriesListDataSourceType = CountriesListDataSource()) {
        self.dataSourceDelegate = dataSourceDelegate
        super.init(frame: .zero)
        buildViewHierarchy()
        applyConstraints()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}

extension CountriesListView: CountriesListViewType {
    func setupTableView() {
        dataSourceDelegate.numberOfRowsInSectionAction = numberOfRowsInSectionAction
        dataSourceDelegate.didSelectRowAtAction = didSelectRowAtAction
        dataSourceDelegate.getCountryName = getCountryName
        dataSourceDelegate.getCountryURL = getCountryURL
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.id)
    }
    
    func updateContent(state: State) {
        DispatchQueue.main.async { [weak self] in
            switch state {
            case .error:
                self?.tableView.isHidden = true
                print("Erro")
            case .loading:
                self?.tableView.isHidden = true
                print("Loading")
            case .ready:
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
            }
        }
    }
}
