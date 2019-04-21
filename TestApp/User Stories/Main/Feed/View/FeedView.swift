//
//  FeedView.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

class FeedView: UITableViewController {
    var presenter: FeedViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath) as! FeedTableViewCell
        cell.fill()

        return cell
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FeedView: FeedViewInput {
    
}
