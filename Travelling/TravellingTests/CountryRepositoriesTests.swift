//
//  CountryRepositoryTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import XCTest
@testable import Travelling

class CountryRepositoryTests: XCTestCase {

    var sut: CountryRepositoryType!
    var dataTask: TravellingDataTaskMock!
    
    override func setUpWithError() throws {
        dataTask = TravellingDataTaskMock()
        sut = CountryRepository(dataTask: dataTask)
    }

    override func tearDownWithError() throws {
        dataTask = nil
        sut = nil
    }

    func testGetCountries() {
        sut.getCountries { _ in }
        XCTAssertEqual(dataTask.dataTaskCount, 1)
    }
    
    func testGetInformation() {
        sut.getCountryInformations(url: URL(string: "https://www.google.com.br)")!) { _ in }
        XCTAssertEqual(dataTask.dataTaskCount, 1)
    }
}
