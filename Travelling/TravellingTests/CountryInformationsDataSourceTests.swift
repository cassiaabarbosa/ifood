//
//  CountryInformationsDataSourceTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import XCTest
import Foundation
import UIKit
import MapKit
@testable import Travelling

final class CountryInformationsDataSourceTests: XCTestCase {

    var sut: CountryInformationsDataSource!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        sut = CountryInformationsDataSource()
        tableView = UITableView()
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(sut.numberOfSections(in: tableView), 1)
    }
    
    
    func testNumberOfRowsInSections() {
        XCTAssertEqual(sut.tableView(tableView, numberOfRowsInSection: 0), 9)
    }
    

    func testCellForRowAt() {
        tableView.register(CountryInformationCell.self, forCellReuseIdentifier: CountryInformationCell.id)
        sut.getTitle = { title in
            return "Title"
        }
        
        sut.getDetail = { detail in
            return "Detail"
        }
        
        XCTAssertNotNil(sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? CountryInformationCell)
    }

    func testViewForHeaderInSection() {
        tableView.register(MapHeader.self, forHeaderFooterViewReuseIdentifier: MapHeader.id)
        
        sut.getLocation = {
            return CountryLocation(coordinate: CLLocationCoordinate2D(latitude: 1.1, longitude: 1.1))
        }
        
        XCTAssertNotNil(sut.tableView(tableView, viewForHeaderInSection: 0) as? MapHeader)
    }

    func testHeightForRowAt() {
        XCTAssertEqual(sut.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0)), UITableView.automaticDimension)
    }
    
    func testHeightForHeaderInSection() {
        XCTAssertEqual(sut.tableView(tableView, heightForHeaderInSection: 0), 300)
    }
}

