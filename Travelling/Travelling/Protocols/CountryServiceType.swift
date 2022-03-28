//
//  CountryServiceType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation

protocol CountryRepositoryType: AnyObject {
    func getCountries(_ completion: @escaping (Result<[CountriesResponse], Error>) -> Void)
    func getCountryInformations(url: URL, _ completion: @escaping (Result<CountryInformationsResponse, Error>) -> Void)
}
