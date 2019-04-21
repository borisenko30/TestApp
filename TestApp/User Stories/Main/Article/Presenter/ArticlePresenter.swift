//
//  ArticlePresenter.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

class ArticlePresenter: ArticleViewOutput {
    weak var view: ArticleViewInput?
    var interactor: ArticleInteractorInput?
    var router: ArticleRouterInput?
    
    func viewDidLoad() {
        view?.showArticle(interactor?.articleURLString ?? "")
    }
    
    func dismissArticleView() {
        router?.dismiss(view!)
    }
}

extension ArticlePresenter: ArticleInteractorOutput {
    
}
