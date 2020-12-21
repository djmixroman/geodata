//
//  CDFeature+CoreDataProperties.swift
//  GeoData
//
//  Created by Danil Valeev on 21.12.2020.
//
//

import Foundation
import CoreData


extension CDFeature {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFeature> {
        return NSFetchRequest<CDFeature>(entityName: "CDFeature")
    }

    @NSManaged public var alert: String?
    @NSManaged public var cdi: String?
    @NSManaged public var code: String?
    @NSManaged public var detail: URL?
    @NSManaged public var dmin: Double
    @NSManaged public var felt: String?
    @NSManaged public var gap: Int64
    @NSManaged public var id: String?
    @NSManaged public var ids: String?
    @NSManaged public var mag: Double
    @NSManaged public var magType: String?
    @NSManaged public var mmi: String?
    @NSManaged public var net: String?
    @NSManaged public var nst: Int64
    @NSManaged public var place: String?
    @NSManaged public var propertiesType: String?
    @NSManaged public var rms: Double
    @NSManaged public var sig: Int64
    @NSManaged public var sources: String?
    @NSManaged public var status: String?
    @NSManaged public var time: Int64
    @NSManaged public var title: String?
    @NSManaged public var tsunami: Int64
    @NSManaged public var type: String?
    @NSManaged public var types: String?
    @NSManaged public var tz: String?
    @NSManaged public var updatedAt: Int64
    @NSManaged public var url: URL?
    @NSManaged public var geometry: CDGeometry?
    @NSManaged public var earthquake: CDEarthquake?

}

extension CDFeature : Identifiable {

}
