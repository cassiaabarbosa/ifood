//
//  CountryInformationsPresenter.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation
import UIKit
import MapKit

final class CountryInformationsPresenter: CountryInformationsPresenterType {

    weak var viewController: CountryInformationsViewControllerType?
    private let country: ListedCountry
    private var repository: CountryRepositoryType
    private var informations: CountryInformations = CountryInformations()
    private var titles: [String] = ["Latitude",
                                    "Longitude",
                                    "Official Languages",
                                    "Electricity",
                                    "Calling Code",
                                    "Police",
                                    "Ambulance",
                                    "Fire",
                                    "Vaccinations"]
    private var subtitles: [String] = []

    init(country: ListedCountry,
         repository: CountryRepositoryType = CountryRepository()) {
        self.country = country
        self.repository = repository
    }
    
    private func appendSubtitles() {
        appendLatitude()
        appendLongitude()
        appendOfficialLanguages()
        appendElectricity()
        appendCallingCode()
        appendPolice()
        appendAmbulance()
        appendFire()
        appendVaccinations()
    }
    
    private func appendLatitude() {
        subtitles.append(informations.latitude)
    }
    
    private func appendLongitude() {
        subtitles.append(informations.longitude)
    }
    
    private func appendOfficialLanguages() {
        let languages = informations.officialLanguage?.enumerated().reduce("", { partialResult, languages in
            partialResult.appending("\(languages.element.language)\(languages.offset < (informations.officialLanguage?.count ?? 0) - 1 ? ", " : ".")")
        }) ?? "No information"
        subtitles.append(languages)
    }
    
    private func appendElectricity() {
        subtitles.append("Eletricidade")
    }
    
    private func appendCallingCode() {
        subtitles.append(informations.callingCode ?? "No information")
    }
    
    private func appendPolice() {
        subtitles.append(informations.police ?? "No information")
    }
    
    private func appendAmbulance() {
        subtitles.append(informations.ambulance ?? "No information")
    }
    
    private func appendFire() {
        subtitles.append(informations.fire ?? "No information")
    }
    
    private func appendVaccinations() {
        let vaccines = informations.vaccinations?.enumerated().reduce("", { partialResult, vaccines in
            partialResult.appending("\(vaccines.element.name)\(vaccines.offset < (informations.vaccinations?.count ?? 0) - 1 ? ", " : ".")")
        }) ?? "No information"
        subtitles.append(vaccines)
    }
    
    func requestContryInformations() {
        self.viewController?.show(with: .loading)
        repository.getCountryInformations(url: country.url) { [weak self] result in
            switch result {
            case .success(let response):
                let informations = CountryInformations(name: response.names.name,
                                                       abbreviation: response.names.iso3,
                                                       latitude: response.maps.lat,
                                                       longitude: response.maps.long,
                                                       officialLanguage: response.language,
                                                       electricity: response.electricity.voltage,
                                                       callingCode: response.telephone.calling_code,
                                                       police: response.telephone.police,
                                                       ambulance: response.telephone.ambulance,
                                                       fire: response.telephone.fire,
                                                       vaccinations: response.vaccinations)
                self?.informations = informations
                self?.viewController?.updateViewName(with: "\(informations.name) (\(informations.abbreviation))")
                self?.appendSubtitles()
                self?.viewController?.show(with: .ready)
                
            case .failure(_):
                self?.viewController?.show(with: .error)
            }
        }
    }
    
    func title(of row: Int) -> String {
        if subtitles.isEmpty {
            return ""
        } else {
           return titles[row]
        }
    }
    
    func subtitle(of row: Int) -> String {
        if subtitles.isEmpty {
            return ""
        } else {
           return subtitles[row]
        }
    }
    
    func location() -> CountryLocation {
        CountryLocation(coordinate: CLLocationCoordinate2D(latitude: Double(informations.latitude) ?? 0,
                                                           longitude: Double(informations.longitude) ?? 0))
    }
}
