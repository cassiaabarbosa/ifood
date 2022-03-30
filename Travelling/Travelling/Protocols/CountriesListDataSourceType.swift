//
//  CountriesListDataSourceType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import UIKit

protocol CountriesListDataSourceType: UITableViewDataSource, UITableViewDelegate {
    var numberOfRowsInSectionAction: (() -> Int)? { get set }
    var didSelectRowAtAction: ((ListedCountry) -> Void)? { get set }
    var getCountryURL: ((Int) -> URL)? { get set }
    var getCountryName: ((Int) -> String)? { get set }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}
