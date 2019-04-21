//
//  FeedTableViewCell.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    // MARK: - Public
    
    func fill(_ model: PONSOArticle) {
        self.titleLabel?.text = model.title
        if let imageURL = URL(string: model.imageMedium), let imageData = try? Data(contentsOf: imageURL) {
            self.thumbImageView?.image = UIImage(data: imageData)
        }
    }

}
