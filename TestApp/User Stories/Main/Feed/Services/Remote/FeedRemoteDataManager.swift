//
//  FeedRemoteDataManager.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import Foundation

class FeedRemoteDataManager: FeedRemoteDataManagerInput {
    weak var requestHandler: FeedRemoteDataManagerOutput?
    
    func fetchArticles() {
        if let url = URL(string: AppConstants.apiURL + AppConstants.apiArticles) {
            HTTPService.shared.request(url: url, onSuccess: { (data) in
                if let articles = try? JSONDecoder().decode([PONSOArticle].self, from: data) {
                    self.requestHandler?.didFetchArticles(articles)
                } else {
                    print("Error: data is corrupted")
                }
            }) { (error) in
                print(error.localizedDescription)
            }
        }
    }
}


