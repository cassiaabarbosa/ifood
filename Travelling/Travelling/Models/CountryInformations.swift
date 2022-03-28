//
//  CountryInformations.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation

struct CountryInformations {
    var name: String = ""
    var abbreviation: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var officialLanguage: [Language]? = nil
    var electricity: String? = nil
    var callingCode: String? = nil
    var police: String? = nil
    var ambulance: String? = nil
    var fire: String? = nil
    var vaccinations: [Vaccinations]? = nil
}
