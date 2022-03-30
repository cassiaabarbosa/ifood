//
//  CountryInformationsViewControllerTests.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import XCTest
import SnapshotTesting
import Foundation
import UIKit
@testable import Travelling

class CountryInformationsViewControllerTests: XCTestCase {
    
    var sut: CountryInformationsViewController!
    var view: CountryInformationViewTypeSpy!
    var presenter: CountryInformationsPresenterTypeSpy!
    
    override func setUpWithError() throws {
        view = CountryInformationViewTypeSpy()
        presenter = CountryInformationsPresenterTypeSpy()
        sut = CountryInformationsViewController(contentView: view, presenter: presenter)
    }

    override func tearDownWithError() throws {
        sut = nil
        view = nil
        presenter = nil
    }

    func testViewDidLoad() throws {
        sut.viewDidLoad()
        XCTAssertEqual(presenter.requestContryInformationsCount, 1)
        XCTAssertEqual(view.setupTableViewCount, 1)
    }
    
    func testLoadView() throws {
        sut.loadView()
        XCTAssertNotNil(sut.view as? CountryInformationViewType)
    }
    
    func testShow() throws {
        sut.show(with: .ready)
        XCTAssertEqual(view.state, .ready)
        XCTAssertEqual(view.updateContentCount, 1)
    }
    
    func testName() throws {
        sut.updateViewName(with: "Name")
        XCTAssertEqual(sut.navigationItem.title, "Name")
    }
}
