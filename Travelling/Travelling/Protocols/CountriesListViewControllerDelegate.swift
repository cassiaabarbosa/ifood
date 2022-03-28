//
//  CountriesListViewControllerDelegate.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation

protocol CountriesListViewControllerDelegate: AnyObject {
    func goToInformations(with country: ListedCountry)
}
