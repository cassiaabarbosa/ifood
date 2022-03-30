//
//  MyDataTaskMock.swift
//  TravellingTests
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
@testable import Travelling

final class TravellingDataTaskMock: TravellingServiceType, TravellingDataTaskType {
    func resume() {}
    
    private(set) var dataTaskCount = 0
    func dataTask(with: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> TravellingDataTaskType {
        dataTaskCount += 1
        return TravellingDataTaskMock()
    }
}
