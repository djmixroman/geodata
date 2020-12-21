//
//  CDGeometry+CoreDataProperties.swift
//  GeoData
//
//  Created by Danil Valeev on 21.12.2020.
//
//

import Foundation
import CoreData


extension CDGeometry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDGeometry> {
        return NSFetchRequest<CDGeometry>(entityName: "CDGeometry")
    }

    @NSManaged public var coordinates: NSObject?
    @NSManaged public var type: String?

}

extension CDGeometry : Identifiable {

}
