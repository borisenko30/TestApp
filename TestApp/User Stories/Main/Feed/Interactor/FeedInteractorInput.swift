//
//  FeedInteractorInput.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol FeedInteractorInput: class {
    var remoteDataManager: FeedRemoteDataManagerInput? { get set }
    var localDataManager: FeedLocalDataManagerInput? { get set }
    var presenter: FeedViewOutput? { get set }
    
    func fetchArticles()
}
