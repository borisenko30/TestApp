//
//  FeedLocalDataManagerInput.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol FeedLocalDataManagerInput: class {
    func saveArticles(_ articles: [PONSOArticle])
    func clearArticles()
}
