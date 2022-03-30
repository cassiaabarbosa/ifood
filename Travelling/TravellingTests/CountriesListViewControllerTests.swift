//
//  CountriesListViewControllerTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import XCTest
import SnapshotTesting
import Foundation
import UIKit
@testable import Travelling

class CountriesListViewControllerTests: XCTestCase {
    
    var sut: CountriesListViewController!
    var view: CountriesListViewTypeSpy!
    var presenter: CountriesListPresenterTypeSpy!
    
    override func setUpWithError() throws {
        view = CountriesListViewTypeSpy()
        presenter = CountriesListPresenterTypeSpy()
        sut = CountriesListViewController(contentView: view, presenter: presenter)
    }

    override func tearDownWithError() throws {
        sut = nil
        view = nil
        presenter = nil
    }

    func testViewDidLoad() throws {
        sut.viewDidLoad()
        XCTAssertEqual(presenter.requestContriesCount, 1)
        XCTAssertEqual(view.setupTableViewCount, 1)
    }
    
    func testLoadView() throws {
        sut.loadView()
        XCTAssertNotNil(sut.view as? CountriesListViewType)
    }
    
    func testShow() throws {
        sut.show(with: .ready)
        XCTAssertEqual(view.state, .ready)
        XCTAssertEqual(view.updateContentCount, 1)
    }
    
    func testViewWillAppear() throws {
        sut.viewWillAppear(true)
        XCTAssertEqual(sut.navigationItem.title, "Countries")
    }
    
    
    func testUpdateSearchResults() throws {
        sut.updateSearchResults(for: UISearchController())
        XCTAssertEqual(presenter.handleSearchCount, 1)
        XCTAssertEqual(presenter.handleSearchContent, "")
    }
}
