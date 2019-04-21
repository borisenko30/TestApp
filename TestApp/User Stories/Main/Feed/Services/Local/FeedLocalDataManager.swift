//
//  FeedLocalDataManager.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import CoreData

class FeedLocalDataManager: FeedLocalDataManagerInput {
    func saveArticles(_ articles: [PONSOArticle]) {
        articles.forEach { saveArticle($0) }
    }
    
    func clearArticles() {
        let coreDataStack = CoreDataStack.shared
        let context = coreDataStack.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        let fetchResult = try? context.fetch(fetchRequest)
        
        fetchResult?.forEach { context.delete($0) }
        coreDataStack.saveContext()
    }
    
    // MARK: - Private
    
    private func saveArticle(_ article: PONSOArticle) {
        let managedObjectArticle = Article(context: CoreDataStack.shared.persistentContainer.viewContext)
        managedObjectArticle.fill(with: article)
        CoreDataStack.shared.saveContext()
    }
}
