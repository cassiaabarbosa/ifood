//
//  CountryInformationCellTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import XCTest
import SnapshotTesting
@testable import Travelling

class CountryInformationCellTests: XCTestCase {

    var sut: CountryInformationCell!
    
    override func setUpWithError() throws {
        sut = CountryInformationCell()
        sut.frame = CGRect(x: 0, y: 0, width: 300, height: 60)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testUpdateName() throws {
        sut.backgroundColor = .white
        sut.show(text: "Title", detailText: "Subtitle")
        assertSnapshot(matching: sut, as: .image)
    }
}
