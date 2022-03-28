//
//  CountryInformationsPresenterType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation
import UIKit

protocol CountryInformationsPresenterType: AnyObject {
    var viewController: CountryInformationsViewControllerType? { get set }
    func requestContryInformations()
    func title(of row: Int) -> String
    func subtitle(of row: Int) -> String
    func location() -> CountryLocation
}
