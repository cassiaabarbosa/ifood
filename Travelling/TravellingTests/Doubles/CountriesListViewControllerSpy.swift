//
//  CountriesListViewControllerSpy.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import Foundation
@testable import Travelling

final class CountriesListViewControllerSpy: CountriesListViewControllerType {
    
    private(set) var showCount =  0
    private(set) var showState: State?
    func show(with state: State) {
        showCount += 1
        showState = state
    }
}
