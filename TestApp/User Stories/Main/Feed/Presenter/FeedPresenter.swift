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
        fetchArticles()
    }
    
    func fetchArticles() {
        interactor?.fetchArticles()
    }
    
    func showArticle(at index: Int) {
        let article = articles[index]
        router?.presentArticleView(with: article.contentURL, imageURLString: article.imageMedium, fromView: view!)
    }
}

extension FeedPresenter: FeedInteractorOutput {
    func didFetchArticles() {
        view?.updateFeed()
    }
    
    func fetchArticlesDidFail(reason: String) {
        print("Error: \(reason)")
        view?.updateFeed()
    }
}
