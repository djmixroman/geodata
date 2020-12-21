//
//  ViewController.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import UIKit


class EarthquakesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: EarthquakesInteractor = EarthquakesInteractorBuilder.build()
    
    private lazy var ddm: EarthquakesDDM = {
        let ddm = EarthquakesDDM()
        ddm.delegate = self
        return ddm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.viewController = self
        
        setupUI()
        
        interactor.loadData()
    }
    
    
    func configure(with viewModels: [EarthquakesViewModel]) {
        ddm.configure(with: viewModels)
    }
    
    private func setupUI() {
        tableView.delegate = ddm
        tableView.dataSource = ddm
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = .estimatedRowHeight
        
        tableView.register(UINib(nibName: EarthquakeCell.className, bundle: nil),
                           forCellReuseIdentifier: EarthquakeCell.reuseIdentifier)
    }
}


extension EarthquakesViewController: EarthquakesDDMDelegate {
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension CGFloat {
    
    fileprivate static var estimatedRowHeight: CGFloat { 140.0 }
}
