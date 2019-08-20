//
//  UIViewController+Extension.swift
//  UtilitiesCore
//
//  Created by João Pedro De Souza Coutinho on 22/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension UIViewController {
    
    /// Removes back button text to the View Controller.
    /// This won't remove the text on the current UIViewController, just on the back button of the pushed view controller.
    func removeBackButtonText() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    /// Sets Navigation Bar transparent.
    ///
    /// - Parameter isTransparent: Should navigation bar be set as transparent.
    func setNavigationBarTransparent(_ isTransparent: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(isTransparent ? UIImage() : nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = isTransparent ? UIImage() : nil
    }
}
