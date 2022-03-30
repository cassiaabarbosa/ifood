//
//  CountryInformationViewType.swift
//  Travelling
//
//  Created by Cassia Barbosa on 29/03/22.
//

import Foundation
import UIKit

protocol CountryInformationViewType where Self: UIView {
    func updateContent(state: State)
    var getTitle: ((Int) -> String)? { get set }
    var getDetail: ((Int) -> String)? { get set }
    var getLocation: (() -> CountryLocation)? { get set }
    func setupTableView()
}
