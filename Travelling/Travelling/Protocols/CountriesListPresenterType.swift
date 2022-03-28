//
//  CountriesPresenterType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 25/03/22.
//

import UIKit

protocol CountriesListPresenterType: AnyObject {
    var viewController: CountriesListViewControllerType? { get set }
    func requestContries()
    func handleSearch(with content: String)
    func numberOfRowsInSection() -> Int
    func countryName(of row: Int) -> String
    func countryURL(of row: Int) -> URL
}
