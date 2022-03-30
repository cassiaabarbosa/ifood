//
//  CountriesListDataSourceTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import XCTest
import Foundation
import UIKit
@testable import Travelling

class CountriesListDataSourceTests: XCTestCase {
    
    var sut: CountriesListDataSource!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        sut = CountriesListDataSource()
        tableView = UITableView()
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
    }

    func testNumberOfRowsInSection() {
        sut.numberOfRowsInSectionAction = {
          9
        }
        XCTAssertEqual( sut.tableView(tableView, numberOfRowsInSection: 0), 9)
    }
    
    func testCellForRowAt() {
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.id)
        XCTAssertNotNil(sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? CountryCell)
    }
    
    func testHeightForRowAt() {
        XCTAssertEqual( sut.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0)), 50)
    }
    
    func testDidSelectRowAt() {
        var listedCountry: ListedCountry?
        sut.didSelectRowAtAction = { country in
            listedCountry = country
        }
        
        sut.didSelectRowAtAction!(ListedCountry(name: "Name", url: URL(string: "https://www.google.com.br")!))

        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(listedCountry, ListedCountry(name: "Name", url: URL(string: "https://www.google.com.br")!))
    }
}
