//
//  CountriyInformationsDataSource.swift
//  Travelling
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import UIKit

final class CountryInformationsDataSource: NSObject, CountryInformationsDataSourceType {
    
    var getTitle: ((Int) -> String)?
    var getDetail: ((Int) -> String)?
    var getLocation: (() -> CountryLocation)?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryInformationCell.id, for: indexPath) as? CountryInformationCell else {
            return UITableViewCell()
        }
        guard let text = getTitle?(indexPath.row),
              let detailText = getDetail?(indexPath.row) else { return UITableViewCell()}
        cell.show(text: text,
                  detailText: detailText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MapHeader.id) as? MapHeader else {
            return UITableViewHeaderFooterView()
        }
        guard let location =  getLocation?() else { return UITableViewHeaderFooterView() }
        header.add(location: location)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       300
    }
}
