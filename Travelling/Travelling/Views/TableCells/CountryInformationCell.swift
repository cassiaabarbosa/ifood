//
//  CountryInformationCell.swift
//  Travelling
//
//  Created by Cassia Barbosa on 27/03/22.
//

import Foundation
import UIKit

class CountryInformationCell: UITableViewCell {
    
    static var id: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupDetailTextAttributes()
        setupTextAttributes()
        selectionStyle = .none
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = ""
        detailTextLabel?.text = ""
    }
    
    private func setupTextAttributes() {
        textLabel?.textColor = .label
        textLabel?.numberOfLines = 0
        textLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        textLabel?.textAlignment = .left
        textLabel?.accessibilityTraits = .header
    }
    
    private func setupDetailTextAttributes() {
        detailTextLabel?.textColor = .secondaryLabel
        detailTextLabel?.textAlignment = .left
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }
    
    func show(text: String, detailText: String) {
        textLabel?.text = text
        detailTextLabel?.text = detailText
    }
}
