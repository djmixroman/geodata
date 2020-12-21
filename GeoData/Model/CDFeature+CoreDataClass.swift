//
//  CDFeature+CoreDataClass.swift
//  GeoData
//
//  Created by Danil Valeev on 21.12.2020.
//
//

import Foundation
import CoreData

@objc(CDFeature)
public class CDFeature: NSManagedObject {
    func configure(with feature: Feature) {
        updatedAt = Int64(feature.properties.updated)
        place = feature.properties.place
        mag = feature.properties.mag ?? 0
        time = Int64(feature.properties.time)
    }
}
