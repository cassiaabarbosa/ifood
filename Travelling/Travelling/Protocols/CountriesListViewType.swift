//
//  CountriesListViewType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import UIKit

protocol CountriesListViewType where Self: UIView {
    var numberOfRowsInSectionAction: (() -> Int)? { get set }
    var didSelectRowAtAction: ((ListedCountry) -> Void)? { get set }
    var getCountryURL: ((Int) -> URL)? { get set }
    var getCountryName: ((Int) -> String)? { get set }
    func updateContent(state: State)
    func setupTableView()
}
