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
    
    init(feature: Feature) {
        self.init(placeName: feature.properties.place,
                  date: Date(timeIntervalSince1970: TimeInterval(feature.properties.time) / 1000),
                  magnitude: feature.properties.mag ?? 0.0)
    }

    init(cdFeature: CDFeature) {
        self.init(placeName: cdFeature.place ?? "",
                  date: Date(timeIntervalSince1970: TimeInterval(cdFeature.time) / 1000),
                  magnitude: cdFeature.mag)
    }
    
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
