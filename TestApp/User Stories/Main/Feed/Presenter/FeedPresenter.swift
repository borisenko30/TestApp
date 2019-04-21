//
//  FeedPresenter.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

class FeedPresenter: FeedViewOutput {
    weak var view: FeedViewInput?
    var interactor: FeedInteractorInput?
    var router: FeedRouterInput?
    
    func viewDidLoad() {
        interactor?.fetchArticles()
    }
}

extension FeedPresenter: FeedInteractorOutput {
    
}
