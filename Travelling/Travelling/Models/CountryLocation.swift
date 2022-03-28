//
//  CountryLocation.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import MapKit
import UIKit

class CountryLocation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
