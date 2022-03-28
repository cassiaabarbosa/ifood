//
//  MapHeader.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation
import UIKit
import MapKit

final class MapHeader: UITableViewHeaderFooterView {

    static var id: String {
        return String(describing: self)
    }
    
    private let mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(mapView)
    }
    
    private func setupConstraints() {
        mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        mapView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func add(location: CountryLocation) {
        let span = MKCoordinateSpan.init(latitudeDelta: 30, longitudeDelta: 30)
        let region = MKCoordinateRegion.init(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(location)
    }
}
