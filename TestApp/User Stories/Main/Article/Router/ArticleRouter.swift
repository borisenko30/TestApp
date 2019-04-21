//
//  ArticleRouter.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

class ArticleRouter: ArticleRouterInput {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createArticleModule(with urlString: String) -> UIViewController {
        let navigationController = storyboard.instantiateViewController(withIdentifier: "ArticleNavigationController")
        
        if let view = navigationController.children.first as? ArticleViewInput {
            let presenter: ArticleViewOutput & ArticleInteractorOutput = ArticlePresenter()
            let interactor: ArticleInteractorInput = ArticleInteractor()
            let router: ArticleRouterInput = ArticleRouter()
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = view
            interactor.presenter = presenter
            interactor.articleURLString = urlString
            
            return navigationController
        }
        
        return UIViewController()
    }
    
    func dismiss(_ view: ArticleViewInput) {
        (view as! UIViewController).dismiss(animated: true, completion: nil)
    }
}
