//
//  FeedRouterInput.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

protocol FeedRouterInput: class {
    static func createFeedModule() -> UIViewController
    func presentArticleView(with urlString: String, imageURLString: String, fromView: FeedViewInput)
}
