//
//  CoreDataProvider.swift
//  GeoData
//
//  Created by Danil Valeev on 21.12.2020.
//

import Foundation
import CoreData

protocol CoreDataProviderProtocol {
    func fetchEarthquake(completion: @escaping (CDEarthquake?, Error?) -> Void)
    func save(earthquake: Earthquake)
}

final class CoreDataProvider: CoreDataProviderProtocol {

    func fetchEarthquake(completion: @escaping (CDEarthquake?, Error?) -> Void) {
        let fetchRequest: NSFetchRequest = CDEarthquake.fetchRequest()
        fetchRequest.fetchLimit = 1
        // чтобы получить earthquake с наибольшим значением generated
        // generated использовал в качестве timestamp
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \CDEarthquake.generated, ascending: false)]

        DispatchQueue.main.async {
            do {
                let cdEarthquake = try Self.persistentContainer.viewContext.fetch(fetchRequest)

                completion(cdEarthquake.first, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func save(earthquake: Earthquake) {
        Self.persistentContainer.performBackgroundTask { context in
            do {
                let cdEarthquake = CDEarthquake(context: context)
                cdEarthquake.configure(with: earthquake)

                earthquake.features.forEach { feature in
                    let cdFeature = CDFeature(context: context)
                    cdFeature.configure(with: feature)
                    cdFeature.earthquake = cdEarthquake
                }

                try context.save()
                
                print("saved to Core Data")
            } catch {
                print("Error on context save: \(error.localizedDescription)")
            }
        }
    }

    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }

        return container
    }()

}
