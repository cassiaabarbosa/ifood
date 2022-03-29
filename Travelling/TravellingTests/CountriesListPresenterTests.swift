//
//  CountriesListPresenterTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import XCTest
@testable import Travelling

class CountriesListPresenterTests: XCTestCase {

    var repository: CountryRepositoryMock!
    var sut: CountriesListPresenterType!
    var controller: CountriesListViewControllerSpy!
    
    override func setUpWithError() throws {
        repository = CountryRepositoryMock()
        controller = CountriesListViewControllerSpy()
        sut = CountriesListPresenter(repository: repository)
        sut.viewController = controller
    }

    override func tearDownWithError() throws {
        repository = nil
        sut = nil
    }

    func testRequestContriesWithError() throws {
        sut.requestContries()
        XCTAssertEqual(controller.showCount, 2)
        XCTAssertEqual(controller.showState, State.error)
    }
    
    func testRequestContriesWithSuccess() throws {
        repository.getCountriesResult = .success([CountriesResponse(name: "Name", url: URL(fileURLWithPath: "https://www.google.com.br"))])
        sut.requestContries()
        XCTAssertEqual(controller.showCount, 2)
        XCTAssertEqual(controller.showState, State.ready)
    }
    
    func testHandleSearch() throws {
        repository.getCountriesResult = .success([CountriesResponse(name: "Name", url: URL(fileURLWithPath: "https://www.google.com.br"))])
        sut.requestContries()
        XCTAssertEqual(controller.showCount, 2)
        XCTAssertEqual(controller.showState, State.ready)
    }
    
    func testNumberOfRowsInSection() throws {
        repository.getCountriesResult = .success([CountriesResponse(name: "Name", url: URL(fileURLWithPath: "https://www.google.com.br"))])
        sut.requestContries()
        XCTAssertEqual(sut.numberOfRowsInSection(), 1)
    }
    
    func testCountryName() throws {
        repository.getCountriesResult = .success([CountriesResponse(name: "Name", url: URL(fileURLWithPath: "https://www.google.com.br"))])
        sut.requestContries()
        XCTAssertEqual(sut.countryName(of: 0), "Name")
    }
    
    func testCountryURL() throws {
        repository.getCountriesResult = .success([CountriesResponse(name: "Name", url: URL(fileURLWithPath: "https://www.google.com.br"))])
        sut.requestContries()
        XCTAssertEqual(sut.countryURL(of: 0), URL(fileURLWithPath: "https://www.google.com.br"))
    }
}
