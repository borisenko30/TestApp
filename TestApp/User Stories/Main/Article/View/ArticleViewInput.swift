//
//  ArticleViewInput.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol ArticleViewInput: class {
    var presenter: ArticleViewOutput? { get set }
    
    func showArticle(_ urlString: String)
}
