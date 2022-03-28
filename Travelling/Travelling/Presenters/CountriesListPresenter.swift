//
//  CountriesPresenter.swift
//  Travelling
//
//  Created by Cassia Barbosa on 25/03/22.
//

import UIKit

final class CountriesListPresenter: CountriesListPresenterType {

    weak var viewController: CountriesListViewControllerType?
    private var repository: CountryRepositoryType
    private var countries: [ListedCountry] = []
    private(set) var filteredCountries: [ListedCountry] = []
    
    init(repository: CountryRepositoryType = CountryRepository()) {
        self.repository = repository
    }
    
    func requestContries() {
        viewController?.show(with: .loading)
        repository.getCountries() { [weak self] result in
            switch result {
            case .success(let response):
                let countries = response.map {
                    ListedCountry(name: $0.name,
                            url: $0.url)
                }
                self?.filteredCountries = countries
                self?.countries = countries
                self?.viewController?.show(with: .ready)
            case .failure(_):
                self?.viewController?.show(with: .error)
            }
        }
    }
    
    func handleSearch(with content: String) {
        if content.isEmpty {
            filteredCountries = countries
            
        } else {
            filteredCountries = countries.filter {
                $0.name.uppercased().contains(content.uppercased())
            }
        }

        viewController?.show(with: .ready)
    }
    
    func numberOfRowsInSection() -> Int {
        filteredCountries.count
    }
    
    func countryName(of row: Int) -> String {
        filteredCountries[row].name
    }
    
    func countryURL(of row: Int) -> URL {
        filteredCountries[row].url
    }
}

