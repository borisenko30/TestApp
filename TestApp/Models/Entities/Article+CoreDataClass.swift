//
//  Article+CoreDataClass.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {
    func getPONSO() -> PONSOArticle {
        return PONSOArticle(id: Int(self.id),
                            title: self.title ?? "",
                            imageMedium: self.imageMedium ?? "",
                            imageThumb: self.imageThumb ?? "",
                            contentURL: self.contentURL ?? "")
    }
    
    func fill(with ponso: PONSOArticle) {
        self.id = Int32(ponso.id)
        self.title = ponso.title
        self.imageMedium = ponso.imageMedium
        self.imageThumb = ponso.imageThumb
        self.contentURL = ponso.contentURL
    }
}
