//
//  ArticlePresenter.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import Foundation

class ArticlePresenter: ArticleViewOutput {
    weak var view: ArticleViewInput?
    var interactor: ArticleInteractorInput?
    var router: ArticleRouterInput?
    
    var articleURLString: String? { return interactor?.articleURLString }
    var imageURLString: String? { return interactor?.imageURLString }
    
    func viewDidLoad() {
        view?.showArticle(articleURLString ?? "")
    }
    
    func dismissArticleView() {
        router?.dismiss(view!)
    }
}

extension ArticlePresenter: ArticleInteractorOutput {
    
}
