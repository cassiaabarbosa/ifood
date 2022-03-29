//
//  CountryInformationsViewControllerSpy.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import Foundation
@testable import Travelling

final class CountryInformationsViewControllerSpy: CountryInformationsViewControllerType {

    private(set) var updateViewNameCount =  0
    private(set) var name: String?
    func updateViewName(with name: String) {
        updateViewNameCount += 1
        self.name = name
    }
    
    private(set) var showCount =  0
    private(set) var showState: State?
    func show(with state: State) {
        showCount += 1
        showState = state
    }
}
