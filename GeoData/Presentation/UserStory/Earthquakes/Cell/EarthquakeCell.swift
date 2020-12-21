//
//  EarthquakeCell.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import UIKit

class EarthquakeCell: UITableViewCell {

    @IBOutlet private weak var placeLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var magnitudeLabel: UILabel!

    
    func configure(with viewModel: EarthquakesViewModel) {
        placeLabel.text = viewModel.placeName
        magnitudeLabel.text = String(format: "%.1f", viewModel.magnitude)
        dateLabel.text = viewModel.date
    }
    
}
