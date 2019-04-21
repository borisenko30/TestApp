//
//  HTTPService.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get
    case post
    case put
    case delete
}

class HTTPService {
    
    static let shared = HTTPService()
    
    private init() {}
    
    // MARK: - Public
    
    func request(url: URL,
                 method: HttpMethod = .get,
                 onSuccess: ((Data) -> Void)?,
                 onFailure: ((Error) -> Void)?) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                onFailure?(error!)
                return
            }
            
            if let data = data {
                onSuccess?(data)
            }
        }.resume()
    }
}
