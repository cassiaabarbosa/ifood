//
//  MapHeaderTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import XCTest
import SnapshotTesting
import MapKit
@testable import Travelling

class MapHeaderTests: XCTestCase {

    var sut: MapHeader!
    
    override func setUpWithError() throws {
        sut = MapHeader()
        sut.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testUpdateName() throws {
        sut.backgroundColor = .white
        sut.add(location: CountryLocation(coordinate: CLLocationCoordinate2D(latitude: Double(1.1), longitude: Double(1.1))))
        assertSnapshot(matching: sut, as: .image)
    }
}
