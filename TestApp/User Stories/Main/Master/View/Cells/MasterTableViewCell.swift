//
//  MasterTableViewCell.swift
//  TestApp
//
//  Created by Oleksandr on 4/20/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    // MARK: - Public
    
    func fill() {
        self.textLabel?.text = "it's alive"
        self.imageView?.image = nil
    }

}
