//
//  CountriesListDataSource.swift
//  Travelling
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import UIKit

final class CountriesListDataSource: NSObject, CountriesListDataSourceType {
    
    var numberOfRowsInSectionAction: (() -> Int)?
    var didSelectRowAtAction: ((ListedCountry) -> Void)?
    var getCountryURL: ((Int) -> URL)?
    var getCountryName: ((Int) -> String)?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSectionAction?() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.id, for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        
        let country = getCountryName?(indexPath.row) ?? ""
        cell.updateName(with: country)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        guard let countryURL = getCountryURL?(indexPath.row) else { return }
        let countryName = getCountryName?(indexPath.row) ?? ""
        let country = ListedCountry(name: countryName, url: countryURL)
        didSelectRowAtAction?(country)
        cell?.isSelected = false
    }
}
