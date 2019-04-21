//
//  UIViewController + Extensions.swift
//  TestApp
//
//  Created by Oleksandr on 4/21/19.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

extension UIViewController {
    func actionSheetController(title: String?, message: String?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        // used to prevent crash on iPad
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = CGRect(x: view.bounds.midX,
                                                  y: view.bounds.midY,
                                                  width: 0,
                                                  height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        return alertController
    }
    
    func showActionSheet(for actions: [UIAlertAction]) {
        let alertController = actionSheetController(title: nil, message: nil)
        actions.forEach(alertController.addAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
