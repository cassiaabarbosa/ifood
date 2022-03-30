//
//  TravellingDataTaskType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
protocol TravellingServiceType {
    func dataTask(with: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> TravellingDataTaskType
}

protocol TravellingDataTaskType {
    func resume()
}
