//
//  FeedRouter.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

class FeedRouter: FeedRouterInput {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createFeedModule() -> UIViewController {
        let navigationController = storyboard.instantiateViewController(withIdentifier: "FeedNavigationController")
        
        if let view = navigationController.children.first as? FeedViewInput {
            let presenter: FeedViewOutput & FeedInteractorOutput = FeedPresenter()
            let interactor: FeedInteractorInput & FeedRemoteDataManagerOutput = FeedInteractor()
            let router: FeedRouterInput = FeedRouter()
            let remoteDataManager: FeedRemoteDataManagerInput = FeedRemoteDataManager()
            let localDataManager: FeedLocalDataManagerInput = FeedLocalDataManager()
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = view
            interactor.remoteDataManager = remoteDataManager
            interactor.localDataManager = localDataManager
            interactor.presenter = presenter
            remoteDataManager.requestHandler = interactor
//            localDataManager.requestHandler = interactor
            
            return navigationController
        }
        
        return UIViewController()
    }
    
    func presentArticleView(with urlString: String, fromView: FeedViewInput) {
        let articleView = ArticleRouter.createArticleModule(with: urlString)
        (fromView as! UIViewController).present(articleView, animated: true, completion: nil)
    }
}
