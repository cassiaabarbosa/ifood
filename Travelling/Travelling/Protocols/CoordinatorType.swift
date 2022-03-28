//
//  Coordinator.swift
//  Travelling
//
//  Created by Cassia Barbosa on 25/03/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var currentController: UIViewController? { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
