//
//  EarthquakesDDM.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import UIKit


protocol EarthquakesDDMDelegate: class {
    
    func reloadTableView()
}

final class EarthquakesDDM: NSObject {
    
    weak var delegate: EarthquakesDDMDelegate?
    
    private var viewModels: [EarthquakesViewModel] = []
    
    
    func configure(with viewModels: [EarthquakesViewModel]) {
        self.viewModels = viewModels
        
        delegate?.reloadTableView()
    }
}

 
extension EarthquakesDDM: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EarthquakeCell.reuseIdentifier) as! EarthquakeCell
        
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }
}

extension EarthquakesDDM: UITableViewDelegate {
    
    
}
