//
//  Interactor.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import Foundation


enum EarthquakesInteractorBuilder {
    
    static func build() -> EarthquakesInteractor {
        let networkProvider = NetworkProvider()

        let coreDataProviderProtocol = CoreDataProvider()
        
        let earthquakesService = EarthquakesService(networkProviderProtocol: networkProvider,
                                                    coreDataProviderProtocol: coreDataProviderProtocol)
        
        let interactor = EarthquakesInteractor(earthquakesService: earthquakesService)
        
        return interactor
    }
}

final class EarthquakesInteractor {
    
    
    weak var viewController: EarthquakesViewController?
    
    
    // MARK: - Private Properties
    
    private let earthquakesService: EarthquakesServiceProtocol
    
    private let queue = DispatchQueue(label: "com.geodata.earthquakes-interactor-queue",
                                      qos: .utility,
                                      attributes: .concurrent)
    
    
    // MARK: - Init
    
    init(earthquakesService: EarthquakesServiceProtocol) {
        self.earthquakesService = earthquakesService
    }
    
    
    // MARK: - Public Methods
    
    func loadData() {
        queue.async {
            self.earthquakesService.fetchEarthquakesData(
                networkCompletion: { earthquake, error in
                    if let error = error {
                        print(error)
                    }

                    if let earthquake = earthquake {
                        let viewModels = earthquake.features.compactMap { EarthquakesViewModel(feature: $0) }

                        DispatchQueue.main.async {
                            self.viewController?.configure(with: viewModels)
                            print("loaded from Network")
                        }
                    }
                },
                coreDataCompletion: { cdEarthquake, error in
                    if let error = error {
                        print("Failed to fetch: \(error.localizedDescription)")
                    }

                    DispatchQueue.main.async {
                        if let cdEarthquake = cdEarthquake {
                            let viewModels = cdEarthquake.sortedFeatures.compactMap { EarthquakesViewModel(cdFeature: $0) }

                            self.viewController?.configure(with: viewModels)
                            print("loaded from Core Data")
                        }
                    }
                }
            )
        }
    }
    
}
