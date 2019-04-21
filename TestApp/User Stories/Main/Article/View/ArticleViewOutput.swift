//
//  ArticleViewOutput.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol ArticleViewOutput: class {
    var view: ArticleViewInput? { get set }
    var interactor: ArticleInteractorInput? { get set }
    var router: ArticleRouterInput? { get set }
    
    func viewDidLoad()
    func dismissArticleView()
}
