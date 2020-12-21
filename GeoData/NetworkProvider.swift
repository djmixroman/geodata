//
//  NetworkProvider.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import Foundation


enum NetworkProviderError: Error {
    case networkUnavailable
}

protocol NetworkProviderProtocol {
    
    func request(by url: URL, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkProvider: NetworkProviderProtocol {
    
    private let session = URLSession(configuration: .default)
    
    func request(by url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let task = session.dataTask(with: url) { data, _, urlSessionError in
        
            guard urlSessionError == nil else {
                completion(nil, urlSessionError)
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkProviderError.networkUnavailable)
                return
            }
           
            completion(data, nil)
        }

        task.resume()
    }
}
