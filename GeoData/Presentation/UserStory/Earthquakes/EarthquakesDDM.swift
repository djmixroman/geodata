//
//  EarthquakesDDM.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import UIKit


final class EarthquakesDDM: NSObject {
    
    private var viewModels: [EarthquakesViewModel] = []
    
    
    func configure(with viewModels: [EarthquakesViewModel]) {
        self.viewModels = viewModels
    }
}

 
extension EarthquakesDDM: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(style: .subtitle, reuseIdentifier: "sdsds")
    }
}

extension EarthquakesDDM: UITableViewDelegate {
    
    
}
