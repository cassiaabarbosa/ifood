//
//  CountryInformationsDataSourceTypeMock.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import UIKit
import MapKit
@testable import Travelling

final class CountryInformationsDataSourceTypeMock: NSObject, CountryInformationsDataSourceType {
    
    var getTitle: ((Int) -> String)?
    
    var getDetail: ((Int) -> String)?
    
    var getLocation: (() -> CountryLocation)?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryInformationCell.id, for: indexPath) as? CountryInformationCell else {
            return UITableViewCell()
        }
        
        cell.show(text: "Latitude", detailText: "1.1")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MapHeader.id) as? MapHeader else {
            return UITableViewHeaderFooterView()
        }
       
        header.add(location: CountryLocation(coordinate: CLLocationCoordinate2D(latitude: 1.1, longitude: 1.1)))
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        300
    }
}
