//
//  CountryCellTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import XCTest
import SnapshotTesting
@testable import Travelling

class CountryCellTests: XCTestCase {

    var sut: CountryCell!
    
    override func setUpWithError() throws {
        sut = CountryCell()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testUpdateName() throws {
        sut.backgroundColor = .white
        sut.updateName(with: "Name")
        assertSnapshot(matching: sut, as: .image)
    }
}
