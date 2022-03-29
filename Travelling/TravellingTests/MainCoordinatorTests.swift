//
//  MainCoordinatorTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import XCTest
@testable import Travelling

class MainCoordinatorTests: XCTestCase {

    var sut: MainCoordinator!
    var navigation: UINavigationController!
    
    override func setUpWithError() throws {
        navigation = UINavigationController()
        sut = MainCoordinator(navigationController: navigation)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigation = nil
    }

    func testStart() throws {
        sut.start()
        XCTAssertNotNil(sut.currentController as? CountriesListViewController)
    }
    
    func testGoToInformations() throws {
        sut.goToInformations(with: ListedCountry(name: "Name", url: URL(fileURLWithPath: "https://www.google.com.br")))
        XCTAssertNotNil(sut.currentController as? CountryInformationsViewController)
    }
}

