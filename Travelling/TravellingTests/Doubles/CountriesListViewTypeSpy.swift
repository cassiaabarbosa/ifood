//
//  CountriesListViewTypeSpy.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
@testable import Travelling
import UIKit

final class CountriesListViewTypeSpy: UIView, CountriesListViewType {
    var numberOfRowsInSectionAction: (() -> Int)?
    
    var didSelectRowAtAction: ((ListedCountry) -> Void)?
    
    var getCountryURL: ((Int) -> URL)?
    
    var getCountryName: ((Int) -> String)?
    
    private(set) var setupTableViewCount = 0
    func setupTableView() {
        setupTableViewCount += 1
    }
    
    private(set) var updateContentCount = 0
    private(set) var state: State?
    func updateContent(state: State) {
        updateContentCount += 1
        self.state = state
    }
}
