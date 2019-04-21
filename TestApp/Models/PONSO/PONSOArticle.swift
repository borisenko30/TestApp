//
//  PONSOArticle.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

struct PONSOArticle: Codable {
    var id: Int
    var title: String
    var imageMedium: String
    var imageThumb: String
    var contentURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageMedium = "image_medium"
        case imageThumb = "image_thumb"
        case contentURL = "content_url"
    }
}
