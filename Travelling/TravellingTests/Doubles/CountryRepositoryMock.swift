//
//  CountryRepositoryMock.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 28/03/22.
//

import Foundation
@testable import Travelling

final class CountryRepositoryMock: CountryRepositoryType {
    
    var getCountriesResult: (Result<[CountriesResponse], Error>) = .failure(NSError(domain: "invalid URL", code: 0))
    
    func getCountries(_ completion: @escaping (Result<[CountriesResponse], Error>) -> Void) {
        completion(getCountriesResult)
    }
    
   var getCountryInformationsResult: (Result<CountryInformationsResponse, Error>) = .failure(NSError(domain: "invalid URL", code: 0))
    func getCountryInformations(url: URL, _ completion: @escaping (Result<CountryInformationsResponse, Error>) -> Void) {
        completion(getCountryInformationsResult)
    }
}
