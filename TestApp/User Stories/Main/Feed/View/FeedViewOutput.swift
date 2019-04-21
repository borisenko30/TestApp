//
//  FeedViewOutput.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

protocol FeedViewOutput: class {
    var view: FeedViewInput? { get set }
    var interactor: FeedInteractorInput? { get set }
    var router: FeedRouterInput? { get set }
    
    var articles: [PONSOArticle] { get }
    
    func viewDidLoad()
    func showArticle(at index: Int)
}
