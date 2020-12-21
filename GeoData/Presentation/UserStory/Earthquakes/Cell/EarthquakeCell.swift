//
//  EarthquakeCell.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import UIKit

class EarthquakeCell: UITableViewCell {
    
    static var className: String {
        NSStringFromClass(EarthquakeCell.self).components(separatedBy: ".").last!
    }
    
    static var reuseIdentifier: String {
        EarthquakeCell.className + "_Identifier"
    }

    @IBOutlet private weak var placeLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var magnitudeLabel: UILabel!

    
    func configure(with viewModel: EarthquakesViewModel) {
        placeLabel.text = viewModel.placeName
        magnitudeLabel.text = viewModel.magnitude
        dateLabel.text = viewModel.date
    }
    
}
