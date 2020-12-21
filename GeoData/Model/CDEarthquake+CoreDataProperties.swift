//
//  CDEarthquake+CoreDataProperties.swift
//  GeoData
//
//  Created by Danil Valeev on 21.12.2020.
//
//

import Foundation
import CoreData


extension CDEarthquake {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEarthquake> {
        return NSFetchRequest<CDEarthquake>(entityName: "CDEarthquake")
    }

    @NSManaged public var generated: Int64
    @NSManaged public var url: String?
    @NSManaged public var title: String?
    @NSManaged public var count: Int64
    @NSManaged public var features: Set<CDFeature>

}

// MARK: Generated accessors for features
extension CDEarthquake {

    @objc(addFeaturesObject:)
    @NSManaged public func addToFeatures(_ value: CDFeature)

    @objc(removeFeaturesObject:)
    @NSManaged public func removeFromFeatures(_ value: CDFeature)

    @objc(addFeatures:)
    @NSManaged public func addToFeatures(_ values: NSSet)

    @objc(removeFeatures:)
    @NSManaged public func removeFromFeatures(_ values: NSSet)

}

extension CDEarthquake : Identifiable {

}
