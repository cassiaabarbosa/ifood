//
//  CountriesListPresenterTypeSpy.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
@testable import Travelling

final class CountriesListPresenterTypeSpy: CountriesListPresenterType {
    var viewController: CountriesListViewControllerType?
    
    private(set) var requestContriesCount = 0
    func requestContries() {
        requestContriesCount += 1
    }
    
    private(set) var handleSearchCount = 0
    private(set) var handleSearchContent: String?
    func handleSearch(with content: String) {
        handleSearchCount += 1
        handleSearchContent = content
    }
    
    func numberOfRowsInSection() -> Int {
        1
    }
    
    func countryName(of row: Int) -> String {
        ""
    }
    
    func countryURL(of row: Int) -> URL {
        URL(string: "")!
    }
}
