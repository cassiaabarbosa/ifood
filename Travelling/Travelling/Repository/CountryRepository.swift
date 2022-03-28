//
//  CountryService.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation

class CountryRepository: CountryRepositoryType {
    func getCountries(_ completion: @escaping (Result<[CountriesResponse], Error>) -> Void) {
        URLSession.shared.decodedDataTask(with: .getCountries, decodeTo: [CountriesResponse].self, completion)
    }
    
    func getCountryInformations(url: URL, _ completion: @escaping (Result<CountryInformationsResponse, Error>) -> Void) {
        URLSession.shared.decodedDataTask(with: url, decodeTo: CountryInformationsResponse.self, completion)
    }
}

extension URL {
    static var getCountries: URL? {
        makeForEndpoint("countries.json")
    }
}

private extension URL {
    static private func makeForEndpoint(_ endpoint: String) -> URL? {
        return URL(string: "https://travelbriefing.org/\(endpoint)")
    }
}

extension URLSession {
    func decodedDataTask<T: Decodable>(with url: URL?,
                                       decodeTo type: T.Type,
                                       _ completion: @escaping (Result<T, Error>) -> Void ) {
        
        guard let url = url else {
            completion(.failure(NSError(domain: "invalid URL", code: 0)))
            return
        }
        dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
