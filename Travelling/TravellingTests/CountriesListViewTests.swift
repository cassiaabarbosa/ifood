//
//  CountriesListViewTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import XCTest
import SnapshotTesting
import Foundation
import UIKit
@testable import Travelling

class CountriesListViewTests: XCTestCase {
    
    var sut: CountriesListView!
    var dataSource: CountriesListDataSourceMock!
    
    override func setUpWithError() throws {
        dataSource = CountriesListDataSourceMock()
        sut = CountriesListView(dataSourceDelegate: dataSource)
        sut.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
    }

    override func tearDownWithError() throws {
        sut = nil
        dataSource = nil
    }

    func testUpdateContentWhenStateIsReady() {
        sut.setupTableView()
        sut.updateContent(state: .ready)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testUpdateContentWhenStateIsLoading() {
        sut.setupTableView()
        sut.updateContent(state: .loading)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testUpdateContentWhenStateIsError() {
        sut.setupTableView()
        sut.updateContent(state: .error)
        assertSnapshot(matching: sut, as: .image)
    }
}
