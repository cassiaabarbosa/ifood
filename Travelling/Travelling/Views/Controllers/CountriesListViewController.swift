//
//  CountriesListViewController.swift
//  Travelling
//
//  Created by Cassia Barbosa on 25/03/22.
//

import Foundation
import UIKit

final class CountriesListViewController: UIViewController {
    
    private let contentView: CountriesListView
    private let presenter: CountriesListPresenterType
    private let searchController = UISearchController(searchResultsController: nil)
    weak var delegate: CountriesListViewControllerDelegate?
    
    init(contentView: CountriesListView = CountriesListView(),
         presenter: CountriesListPresenterType = CountriesListPresenter()) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Countries"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewObjects()
        presenter.requestContries()
        setupSearchcontroller()
    }
    
    private func setupTableViewObjects() {
        contentView.tableViewDataSource = self
        contentView.tableViewDelegate = self
        contentView.setupTableView()
    }
    
    private func setupSearchcontroller() {
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension CountriesListViewController: CountriesListViewControllerType {
    func show(with state: State) {
        contentView.updateContent(state: state)
    }
}

extension CountriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let countryURL = presenter.countryURL(of: indexPath.row)
        let countryName = presenter.countryName(of: indexPath.row)
        let country = ListedCountry(name: countryName, url: countryURL)
        delegate?.goToInformations(with: country)
        cell?.isSelected = false
    }
}

extension CountriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.id, for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        
        let country = presenter.countryName(of: indexPath.row)
        cell.updateName(with: country)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension CountriesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchContent = searchController.searchBar.searchTextField.text else { return }
        presenter.handleSearch(with: searchContent)
    }
}
