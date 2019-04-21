//
//  FeedRemoteDataManagerOutput.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol FeedRemoteDataManagerOutput: class {
    func didFetchArticles(_ articles: [PONSOArticle])
    func fetchArticlesDidFail(reason: String)
}
