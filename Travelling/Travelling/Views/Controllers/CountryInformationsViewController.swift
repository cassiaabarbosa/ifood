//
//  CountryInformationsViewController.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation
import UIKit

final class CountryInformationsViewController: UIViewController {
    
    private let contentView: CountryInformationView
    private let presenter: CountryInformationsPresenterType
    
    init(contentView: CountryInformationView = CountryInformationView(),
         presenter: CountryInformationsPresenterType) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewObjects()
        presenter.requestContryInformations()
    }
    
    private func setupTableViewObjects() {
        contentView.tableViewDataSource = self
        contentView.tableViewDelegate = self
        contentView.setupTableView()
    }
}

extension CountryInformationsViewController: CountryInformationsViewControllerType {
    func show(with state: State) {
        contentView.updateContent(state: state)
    }
    
    func updateViewName(with name: String) {
        navigationItem.title = name
    }
}

extension CountryInformationsViewController: UITableViewDelegate {}

extension CountryInformationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MapHeader.id) as? MapHeader else {
            return UITableViewHeaderFooterView()
        }
        header.add(location: presenter.location())
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryInformationCell.id, for: indexPath) as? CountryInformationCell else {
            return UITableViewCell()
        }
        cell.show(text: presenter.title(of: indexPath.row),
                  detailText: presenter.subtitle(of: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       300
    }
}
