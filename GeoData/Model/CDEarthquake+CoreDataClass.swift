//
//  CDEarthquake+CoreDataClass.swift
//  GeoData
//
//  Created by Danil Valeev on 21.12.2020.
//
//

import Foundation
import CoreData

@objc(CDEarthquake)
public class CDEarthquake: NSManagedObject {
    func configure(with earthquake: Earthquake) {
        generated = Int64(earthquake.metadata.generated)
        url = earthquake.metadata.url
        title = earthquake.metadata.title
        count = Int64(earthquake.metadata.count)
    }

    var sortedFeatures: [CDFeature] {
        features.sorted { $0.updatedAt > $1.updatedAt }
    }
}
