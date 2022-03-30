//
//  CountriesListDataSourceMock.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import UIKit
@testable import Travelling

final class CountriesListDataSourceMock: NSObject, CountriesListDataSourceType {
    
    var numberOfRowsInSectionAction: (() -> Int)?
    var didSelectRowAtAction: ((ListedCountry) -> Void)?
    var getCountryURL: ((Int) -> URL)?
    var getCountryName: ((Int) -> String)?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.id, for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        
        cell.updateName(with: "Brazil")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}
