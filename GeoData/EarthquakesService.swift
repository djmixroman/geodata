//
//  EarthquakesService.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import Foundation

protocol EarthquakesServiceProtocol {
    
    func fetchEarthquakesData(completion: @escaping (Earthquake?, Error?) -> Void)
}

final class EarthquakesService: EarthquakesServiceProtocol {
    
    
    private let networkProviderProtocol: NetworkProviderProtocol
    
    
    init(networkProviderProtocol: NetworkProviderProtocol) {
        self.networkProviderProtocol = networkProviderProtocol
    }
    
    
    func fetchEarthquakesData(completion: @escaping (Earthquake?, Error?) -> Void) {
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

