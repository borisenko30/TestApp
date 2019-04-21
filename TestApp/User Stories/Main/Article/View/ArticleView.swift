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
        
        let shareItem = UIBarButtonItem(title: "Share",
                                        style: .plain,
                                        target: self,
                                        action: #selector(onShare))
        self.navigationItem.rightBarButtonItem = shareItem

    }
    
    private func showShareView(for item: Any) {
        let controller = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        present(controller, animated: true)
    }
    
    @objc private func onBack() {
        presenter?.dismissArticleView()
    }
    
    @objc private func onShare() {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let shareLinkAction = UIAlertAction(title: "Share link", style: .default) { (action) in
            if let urlString = self.presenter?.articleURLString, let url = URL(string: urlString) {
                self.showShareView(for: url)
            }
        }
        
        let shareImageAction = UIAlertAction(title: "Share image", style: .default) { (action) in
            if let imageURLString = self.presenter?.imageURLString, let imageURL = URL(string: imageURLString) {
                UIImage.load(from: imageURL) { (image) in
                    self.showShareView(for: image)
                }
            }
        }
        
        showActionSheet(for: [shareLinkAction, shareImageAction, cancelAction])
    }
}
