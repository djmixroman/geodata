//
//  ViewController.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import UIKit


class ViewController: UIViewController {
    
    let networkProvider = NetworkProvider()
    
    var earthquakesService: EarthquakesService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        earthquakesService = EarthquakesService(networkProviderProtocol: networkProvider)
        
        earthquakesService.fetchEarthquakesData { earthquake, error in
            if let error = error {
                print(error)
            }
            
            if let earthquake = earthquake {
                print(earthquake)
            }
            
        }
        // Do any additional setup after loading the view.
    }


}

