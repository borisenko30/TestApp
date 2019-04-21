//
//  FeedRemoteDataManagerInput.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol FeedRemoteDataManagerInput: class {
    var requestHandler: FeedRemoteDataManagerOutput? { get set }
    func fetchArticles()
}
