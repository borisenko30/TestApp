//
//  ArticleRouterInput.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

protocol ArticleRouterInput: class {
    static func createArticleModule(with urlString: String, imageURLString: String) -> UIViewController
    func dismiss(_ view: ArticleViewInput)
}
