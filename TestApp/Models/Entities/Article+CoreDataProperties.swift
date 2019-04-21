//
//  Article+CoreDataProperties.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var imageMedium: String?
    @NSManaged public var imageThumb: String?
    @NSManaged public var contentURL: String?

}
