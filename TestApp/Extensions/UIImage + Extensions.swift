//
//  UIImage + Extensions.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

extension UIImage {
    class func load(from url: URL, shouldCache: Bool = true, completion: ((UIImage) -> Void)?) {
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data), shouldCache == true {
            completion?(image)
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                guard error == nil else { return }
                if let data = data, let response = response, let image = UIImage(data: data) {
                    if shouldCache {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cachedData, for: request)
                    }
                    DispatchQueue.main.async {
                        completion?(image)
                    }
                }
            }).resume()
        }
    }
}
