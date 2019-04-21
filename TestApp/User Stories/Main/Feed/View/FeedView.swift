//
//  FeedView.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit
import CoreData

class FeedView: UITableViewController, FeedViewInput {
    var presenter: FeedViewOutput?
    var fetchResultsController: NSFetchedResultsController<Article>?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        setupFetchResultsController()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Public
    
    func updateFeed() {
        do {
            try fetchResultsController?.performFetch()
            tableView.reloadData()
        } catch {
            print(error)
        }
        refreshControl?.endRefreshing()
    }

    // MARK: - Table view data source and delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultsController?.fetchedObjects?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath) as! FeedTableViewCell
        let article = fetchResultsController?.object(at: indexPath).getPONSO()
        article.map(cell.fill)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 100 : 60
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showArticle(at: indexPath.row)
    }
    
    // MARK: - Private
    
    private func setupFetchResultsController() {
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: false)
        let context = CoreDataStack.shared.persistentContainer.viewContext
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchResultsController = NSFetchedResultsController<Article>(fetchRequest: fetchRequest,
                                                                     managedObjectContext: context,
                                                                     sectionNameKeyPath: nil,
                                                                     cacheName: "feedCache")
        fetchResultsController?.delegate = self
    }

    @objc private func onRefresh() {
        self.refreshControl?.beginRefreshing()
        presenter?.fetchArticles()
    }
}

extension FeedView: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange sectionInfo: NSFetchedResultsSectionInfo,
                    atSectionIndex sectionIndex: Int,
                    for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            if let cell = tableView.cellForRow(at: indexPath!) as? FeedTableViewCell {
                cell.fill((anObject as! Article).getPONSO())
            }
        case .move:
            if let cell = tableView.cellForRow(at: indexPath!) as? FeedTableViewCell {
                cell.fill((anObject as! Article).getPONSO())
            }
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        @unknown default:
            fatalError("unknown NSFetchedResultsChangeType")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
