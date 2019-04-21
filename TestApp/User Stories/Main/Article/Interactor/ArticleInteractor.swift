//
//  ArticleInteractor.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

class ArticleInteractor: ArticleInteractorInput {
    weak var presenter: ArticleInteractorOutput?
    var articleURLString: String?
    var imageURLString: String?
}
