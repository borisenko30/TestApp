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
    
    var articles: [PONSOArticle] {
        return interactor?.articles ?? []
    }
    
    func viewDidLoad() {
        interactor?.fetchArticles()
    }
    
    func showArticle(at index: Int) {
        router?.presentArticleView(with: articles[index].contentURL, fromView: view!)
    }
}

extension FeedPresenter: FeedInteractorOutput {
    func updateFeed() {
        view?.updateFeed()
    }
}
