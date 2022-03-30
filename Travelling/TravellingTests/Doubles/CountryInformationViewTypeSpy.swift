//
//  CountryInformationViewTypeSpy.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
@testable import Travelling
import UIKit

final class CountryInformationViewTypeSpy: UIView, CountryInformationViewType {
    var getTitle: ((Int) -> String)?
    
    var getDetail: ((Int) -> String)?
    
    var getLocation: (() -> CountryLocation)?
    
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
