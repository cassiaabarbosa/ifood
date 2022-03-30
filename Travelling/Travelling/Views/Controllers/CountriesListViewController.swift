//
//  CountriesListViewController.swift
//  Travelling
//
//  Created by Cassia Barbosa on 25/03/22.
//

import Foundation
import UIKit

final class CountriesListViewController: UIViewController {
    
    private let contentView: CountriesListViewType
    private let presenter: CountriesListPresenterType
    private let searchController = UISearchController(searchResultsController: nil)
    weak var delegate: CountriesListViewControllerDelegate?
    
    init(contentView: CountriesListViewType = CountriesListView(),
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
        bindViewActions()
        presenter.requestContries()
        setupSearchcontroller()
    }
    
    private func bindViewActions() {
        contentView.numberOfRowsInSectionAction = presenter.numberOfRowsInSection
        contentView.didSelectRowAtAction = delegate?.goToInformations
        contentView.getCountryURL = presenter.countryURL
        contentView.getCountryName = presenter.countryName
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

extension CountriesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchContent = searchController.searchBar.searchTextField.text else { return }
        presenter.handleSearch(with: searchContent)
    }
}
