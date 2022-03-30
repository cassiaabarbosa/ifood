//
//  CountryService.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation

class CountryRepository: CountryRepositoryType {
    
    private let dataTask: TravellingServiceType
    
    init(dataTask: TravellingServiceType = URLSession.shared) {
        self.dataTask = dataTask
    }
    
    func getCountries(_ completion: @escaping (Result<[CountriesResponse], Error>) -> Void) {
        guard let url = URL(string: "https://travelbriefing.org/countries.json") else { return }
        let urlRequest = URLRequest(url: url)
        dataTask.dataTask(with: urlRequest) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode([CountriesResponse].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
    
    func getCountryInformations(url: URL, _ completion: @escaping (Result<CountryInformationsResponse, Error>) -> Void) {
        let urlRequest = URLRequest(url: url)
        dataTask.dataTask(with: urlRequest) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(CountryInformationsResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
}

extension URLSession: TravellingServiceType {
    func dataTask(with: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> TravellingDataTaskType {
        
        let task: URLSessionDataTask = self.dataTask(with: with, completionHandler: completionHandler)
        
        return task
    }
}

extension URLSessionDataTask: TravellingDataTaskType {}
