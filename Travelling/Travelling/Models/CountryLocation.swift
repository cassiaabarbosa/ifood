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

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
       return lhs.longitude == rhs.longitude &&
        lhs.latitude == rhs.latitude
        
    }
}
