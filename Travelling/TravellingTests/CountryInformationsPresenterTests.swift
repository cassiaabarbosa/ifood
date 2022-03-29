//
//  CountryInformationsPresenterTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import Foundation
import XCTest
import MapKit
@testable import Travelling

class CountryInformationsPresenterTests: XCTestCase {

    var repository: CountryRepositoryMock!
    var sut: CountryInformationsPresenterType!
    var controller: CountryInformationsViewControllerSpy!
    
    override func setUpWithError() throws {
        repository = CountryRepositoryMock()
        controller = CountryInformationsViewControllerSpy()
        sut = CountryInformationsPresenter(country: ListedCountry(name: "Brasil",
                                                                  url: URL(fileURLWithPath: "hrrps://www.google.com.br")),
                                           repository: repository)
        sut.viewController = controller
    }

    override func tearDownWithError() throws {
        repository = nil
        sut = nil
        controller = nil
    }

    func testRequestContryInformationsWithError() throws {
        sut.requestContryInformations()
        XCTAssertEqual(controller.showCount, 2)
        XCTAssertEqual(controller.showState, .error)
    }
    
    func testRequestContryInformationsWithSuccess() throws {
        repository.getCountryInformationsResult = .success(CountryInformationsResponse(names: Names(name: "Brasil", iso3: "BRA"),
                                                                                       maps: Maps(lat: "1.1", long: "1.1"),
                                                                                       language: [Language(language: "Português",
                                                                                                        official: "YES")],
                                                                                       electricity: Electricity(voltage: "220"),
                                                                                       telephone: Telephone(calling_code: "55",
                                                                                                            police: "181",
                                                                                                            ambulance: "192",
                                                                                                            fire: "000"),
                                                                                       vaccinations: [Vaccinations(name: "Malária")]))
        sut.requestContryInformations()
        XCTAssertEqual(controller.showCount, 2)
        XCTAssertEqual(controller.showState, .ready)
        XCTAssertEqual(controller.updateViewNameCount, 1)
        XCTAssertEqual(controller.name, "Brasil (BRA)")
    }
    
    func testTitleWhenSubtitlesIsNotEmpty() throws {
        repository.getCountryInformationsResult = .success(CountryInformationsResponse(names: Names(name: "Brasil", iso3: "BRA"),
                                                                                       maps: Maps(lat: "1.1", long: "1.1"),
                                                                                       language: [Language(language: "Português",
                                                                                                        official: "YES")],
                                                                                       electricity: Electricity(voltage: "220"),
                                                                                       telephone: Telephone(calling_code: "55",
                                                                                                            police: "181",
                                                                                                            ambulance: "192",
                                                                                                            fire: "000"),
                                                                                       vaccinations: [Vaccinations(name: "Malária")]))
        sut.requestContryInformations()
        XCTAssertEqual( sut.title(of: 0), "Latitude")
    }
    
    func testTitleWhenSubtitlesIsEmpty() throws {
        XCTAssertEqual( sut.title(of: 0), "")
    }

    func testSubtitleWhenSubtitlesIsNotEmpty() throws {
        repository.getCountryInformationsResult = .success(CountryInformationsResponse(names: Names(name: "Brasil", iso3: "BRA"),
                                                                                       maps: Maps(lat: "1.1", long: "1.1"),
                                                                                       language: [Language(language: "Português",
                                                                                                        official: "YES")],
                                                                                       electricity: Electricity(voltage: "220"),
                                                                                       telephone: Telephone(calling_code: "55",
                                                                                                            police: "181",
                                                                                                            ambulance: "192",
                                                                                                            fire: "000"),
                                                                                       vaccinations: [Vaccinations(name: "Malária")]))
        sut.requestContryInformations()
        XCTAssertEqual( sut.subtitle(of: 0), "1.1")
    }
    
    func testSubtitleWhenSubtitlesIsEmpty() throws {
        XCTAssertEqual( sut.subtitle(of: 0), "")
    }
    
    func testLocation() throws {
        repository.getCountryInformationsResult = .success(CountryInformationsResponse(names: Names(name: "Brasil", iso3: "BRA"),
                                                                                       maps: Maps(lat: "1.1", long: "1.1"),
                                                                                       language: [Language(language: "Português",
                                                                                                        official: "YES")],
                                                                                       electricity: Electricity(voltage: "220"),
                                                                                       telephone: Telephone(calling_code: "55",
                                                                                                            police: "181",
                                                                                                            ambulance: "192",
                                                                                                            fire: "000"),
                                                                                       vaccinations: [Vaccinations(name: "Malária")]))
        sut.requestContryInformations()
        XCTAssertEqual(sut.location().coordinate, CLLocationCoordinate2D(latitude: 1.1, longitude: 1.1))
    }
}

