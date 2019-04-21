//
//  ArticleInteractorInput.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol ArticleInteractorInput: class {
    var presenter: ArticleInteractorOutput? { get set }
    var articleURLString: String? { get set }
    var imageURLString: String? { get set }
}
