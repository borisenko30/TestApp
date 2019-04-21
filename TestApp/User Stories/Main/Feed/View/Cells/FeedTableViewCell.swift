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
        if let imageURL = URL(string: model.imageThumb) {
            UIImage.load(from: imageURL) { (image) in
                self.thumbImageView.image = image
            }
        }
    }

}
