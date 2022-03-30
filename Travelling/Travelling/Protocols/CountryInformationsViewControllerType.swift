//
//  CountriesListViewControllerType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation
import UIKit

protocol CountryInformationsViewControllerType where Self: UIViewController {
    func updateViewName(with name: String)
    func show(with state: State)
}
