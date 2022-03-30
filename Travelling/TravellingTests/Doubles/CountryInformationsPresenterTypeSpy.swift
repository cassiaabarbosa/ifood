//
//  CountryInformationsPresenterTypeSpy.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import MapKit
@testable import Travelling

final class CountryInformationsPresenterTypeSpy: CountryInformationsPresenterType {
    var viewController: CountryInformationsViewControllerType?
    
    private(set) var requestContryInformationsCount = 0
    func requestContryInformations() {
        requestContryInformationsCount += 1
    }
    
    func title(of row: Int) -> String {
        ""
    }
    
    func subtitle(of row: Int) -> String {
        ""
    }
    
    func location() -> CountryLocation {
        CountryLocation(coordinate: CLLocationCoordinate2D())
    }
    
}
