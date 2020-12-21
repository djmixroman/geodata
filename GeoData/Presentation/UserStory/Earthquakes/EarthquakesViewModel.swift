//
//  EarthquakesViewModel.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import Foundation


struct EarthquakesViewModel {
    
    var placeName: String
    
    var date: String
    
    var magnitude: String
    
    
    init(placeName: String,
         date: Date,
         magnitude: Double) {
        self.placeName = placeName
        self.magnitude = String(format: "%.1f", magnitude)
        self.date = date.formatted()
    }
}


extension Date {
    
    fileprivate func formatted() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        let string = formatter.string(from: self)
        
        return string
    }
}
