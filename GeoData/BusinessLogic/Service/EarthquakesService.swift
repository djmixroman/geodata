//
//  EarthquakesService.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import Foundation
import CoreData

protocol EarthquakesServiceProtocol {
    
    func fetchEarthquakesData(
        networkCompletion: @escaping (Earthquake?, Error?) -> Void, // optional calling
        coreDataCompletion: @escaping (CDEarthquake?, Error?) -> Void
    )

}

final class EarthquakesService: EarthquakesServiceProtocol {
    
    
    private let networkProviderProtocol: NetworkProviderProtocol

    private let coreDataProviderProtocol: CoreDataProviderProtocol
    
    
    init(networkProviderProtocol: NetworkProviderProtocol,
         coreDataProviderProtocol: CoreDataProviderProtocol) {
        self.networkProviderProtocol = networkProviderProtocol
        self.coreDataProviderProtocol = coreDataProviderProtocol
    }

    func fetchEarthquakesData(
        networkCompletion: @escaping (Earthquake?, Error?) -> Void, // optional calling
        coreDataCompletion: @escaping (CDEarthquake?, Error?) -> Void
    ) {
        let dispatchGroup = DispatchGroup()

        var cdGenerated: Int?
        dispatchGroup.enter()
        coreDataProviderProtocol.fetchEarthquake { (cdEarthquake, error) in
            coreDataCompletion(cdEarthquake, error)
            cdEarthquake.map { cdGenerated = Int($0.generated) }
            dispatchGroup.leave()
        }

        var networkEarthquake: Earthquake?
        dispatchGroup.enter()
        networkFetchEarthquakesData { (earthquake, error) in
            networkCompletion(earthquake, error)
            networkEarthquake = earthquake
            dispatchGroup.leave()
        }

        // save network data to core data if needed
        dispatchGroup.notify(queue: .main) {
            guard let earthquake = networkEarthquake else { return }

            if let cdGenerated = cdGenerated {
                if earthquake.metadata.generated > cdGenerated {
                    self.coreDataProviderProtocol.save(earthquake: earthquake)
                }
            } else {
                self.coreDataProviderProtocol.save(earthquake: earthquake)
            }
        }
    }
    
    private func networkFetchEarthquakesData(completion: @escaping (Earthquake?, Error?) -> Void) {
        networkProviderProtocol.request(by: .earthquakesFeed) { data, error in
            if let error = error {
                completion(nil, error)
            }
            
            guard let data = data else {
                // TODO: - Handle this
                print("Data is nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let earthquake = try decoder.decode(Earthquake.self, from: data)
                
                completion(earthquake, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}

extension URL {
    
    fileprivate static var earthquakesFeed: URL { URL(string: "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson")! }
}

