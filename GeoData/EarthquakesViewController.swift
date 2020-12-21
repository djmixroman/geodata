//
//  ViewController.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import UIKit


class EarthquakesViewController: UIViewController {
    
    
    let interactor: EarthquakesInteractor = EarthquakesInteractorBuilder.build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.loadData()
    }
}

