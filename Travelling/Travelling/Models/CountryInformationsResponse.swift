//
//  CountryInformationsResponse.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation

struct CountryInformationsResponse: Decodable {
    let names: Names
    let maps: Maps
    let language: [Language]
    let electricity: Electricity
    let telephone: Telephone
    let vaccinations: [Vaccinations]
}

struct Names: Decodable {
    let name: String
    let iso3: String
}

struct Maps: Decodable {
    let lat: String
    let long: String
}

struct Language: Decodable {
    let language: String
    let official: String
}

struct Electricity: Decodable {
    let voltage: String
}

struct Telephone: Decodable {
    let calling_code: String
    let police: String
    let ambulance: String
    let fire: String
}

struct Vaccinations: Decodable {
    let name: String
}
