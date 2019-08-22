//
//  UIActivityIndicatorView+Extension.swift
//  UtilitiesCore
//
//  Created by Luca Saldanha Schifino on 18/12/2017.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension UIActivityIndicatorView {
    
    /// Starts animating UIActivityIndicator and shows it.
    /// If a UIRefreshControl is passed as parameter, it only starts animating if refreshControl is not currently animating.
    ///
    /// - Parameter refreshControl: UIRefreshControl that loads the same activity as the UIActivityIndicator.
    func startLoad(withRefreshControl refreshControl: UIRefreshControl? = nil) {
        if refreshControl?.isRefreshing == true {
            isHidden = true
            stopAnimating()
            return
        }
        isHidden = false
        startAnimating()
    }
    
    /// Stops animating UIActivityIndicator and hides it.
    /// If a UIRefreshControl is passed as parameter, it ends its refreshing as well as stops the UIActivityIndicator.
    ///
    /// - Parameters:
    ///   - refreshControl: UIRefreshControl that loads the same activity as the UIActivityIndicator.
    func stopLoad(withRefreshControl refreshControl: UIRefreshControl? = nil) {
        if refreshControl?.isRefreshing == true {
            refreshControl?.endRefreshing()
        }
        isHidden = true
        stopAnimating()
    }
}
