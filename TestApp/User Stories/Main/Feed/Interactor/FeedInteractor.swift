//
//  FeedInteractor.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import Foundation

class FeedInteractor: FeedInteractorInput {
    var remoteDataManager: FeedRemoteDataManagerInput?
    var localDataManager: FeedLocalDataManagerInput?
    weak var presenter: (FeedViewOutput & FeedInteractorOutput)?
    
    private(set) var articles = [PONSOArticle]()
    
    func fetchArticles() {
        remoteDataManager?.fetchArticles()
    }
}

extension FeedInteractor: FeedRemoteDataManagerOutput {
    func didFetchArticles(_ articles: [PONSOArticle]) {
        self.articles = articles
        presenter?.updateFeed()
//        localDataManager?.saveArticles(articles)
    }
}
