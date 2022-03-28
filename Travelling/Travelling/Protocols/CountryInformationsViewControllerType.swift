//
//  CountriesListViewControllerType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation

protocol CountryInformationsViewControllerType: AnyObject {
    func updateViewName(with name: String)
    func show(with state: State)
}
