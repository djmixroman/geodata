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
    @NSManaged public var gap: Int32
    @NSManaged public var id: String?
    @NSManaged public var ids: String?
    @NSManaged public var mag: Double
    @NSManaged public var magType: String?
    @NSManaged public var mmi: String?
    @NSManaged public var net: String?
    @NSManaged public var nst: Int32
    @NSManaged public var place: String?
    @NSManaged public var propertiesType: String?
    @NSManaged public var rms: Double
    @NSManaged public var sig: Int32
    @NSManaged public var sources: String?
    @NSManaged public var status: String?
    @NSManaged public var time: Date?
    @NSManaged public var title: String?
    @NSManaged public var tsunami: Int32
    @NSManaged public var type: String?
    @NSManaged public var types: String?
    @NSManaged public var tz: String?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var url: URL?
    @NSManaged public var geometry: CDGeometry?

}

extension CDFeature : Identifiable {

}
