//
//  CountryInformationView.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation
import UIKit

final class CountryInformationView: UIView {
    
    var getTitle: ((Int) -> String)?
    var getDetail: ((Int) -> String)?
    var getLocation: (() -> CountryLocation)?
    
    private let dataSourceDelegate: CountryInformationsDataSourceType
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(dataSourceDelegate: CountryInformationsDataSourceType = CountryInformationsDataSource()) {
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
   
extension CountryInformationView: CountryInformationViewType {
    func setupTableView() {
        dataSourceDelegate.getLocation = getLocation
        dataSourceDelegate.getTitle = getTitle
        dataSourceDelegate.getDetail = getDetail
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.id)
        tableView.register(CountryInformationCell.self, forCellReuseIdentifier: CountryInformationCell.id)
        tableView.register(MapHeader.self, forHeaderFooterViewReuseIdentifier: MapHeader.id)
    }
    
    func updateContent(state: State) {
        switch state {
        case .error:
            self.tableView.isHidden = true
            print("Erro")
        case .loading:
            self.tableView.isHidden = true
            print("Loading")
        case .ready:
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
}
