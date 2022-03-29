//
//  CountriesListView.swift
//  Travelling
//
//  Created by Cassia Barbosa on 25/03/22.
//

import Foundation
import UIKit

final class CountriesListView: UIView {
    
    var tableViewDelegate: UITableViewDelegate?
    var tableViewDataSource: UITableViewDataSource?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    func setupTableView() {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.id)
    }
    
    func updateContent(state: State) {
        switch state {
        case .error:
            print("Erro")
        case .loading:
            print("Loading")
        case .ready:
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
