//
//  FeedInteractorOutput.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol FeedInteractorOutput: class {
    func didFetchArticles()
    func fetchArticlesDidFail(reason: String)
}
