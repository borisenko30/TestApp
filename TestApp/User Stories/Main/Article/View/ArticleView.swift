//
//  ArticleView.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit
import WebKit

class ArticleView: UIViewController, ArticleViewInput {
    @IBOutlet weak var webView: WKWebView!
    
    var presenter: ArticleViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        setupNavBar()
    }

    // MARK: - Public
    
    func showArticle(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        webView.load(URLRequest(url: url))
    }
    
    // MARK: - Private
    
    private func setupNavBar() {
        let backItem = UIBarButtonItem(title: "Back",
                                       style: .plain,
                                       target: self,
                                       action: #selector(onBack))
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    @objc private func onBack() {
        presenter?.dismissArticleView()
    }
}
