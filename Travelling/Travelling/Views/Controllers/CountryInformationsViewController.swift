//
//  CountryInformationsViewController.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation
import UIKit

final class CountryInformationsViewController: UIViewController {
    
    private let contentView: CountryInformationViewType
    private let presenter: CountryInformationsPresenterType
    
    init(contentView: CountryInformationViewType = CountryInformationView(),
         presenter: CountryInformationsPresenterType) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewActions()
        presenter.requestContryInformations()
    }
    
    private func bindViewActions() {
        contentView.getLocation = presenter.location
        contentView.getTitle = presenter.title
        contentView.getDetail = presenter.subtitle
        contentView.setupTableView()
    }
}

extension CountryInformationsViewController: CountryInformationsViewControllerType {
    func show(with state: State) {
        contentView.updateContent(state: state)
    }
    
    func updateViewName(with name: String) {
        navigationItem.title = name
    }
}
