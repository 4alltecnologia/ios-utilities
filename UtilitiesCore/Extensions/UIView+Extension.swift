//
//  UIView+Extension.swift
//  UtilitiesCore
//
//  Created by Betina Pereira de Farias on 30/11/18.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

public extension UIView {
    static var className: String {
        return String(describing: self)
    }
    
    func removeSubviewOf<T: UIView>(type: T.Type, animationDuration: TimeInterval? = nil) {
        for subview in subviews where subview is T {
            if let duration = animationDuration {
                UIView.animate(withDuration: duration, animations: {
                    subview.alpha = 0
                }, completion: { _ in
                    subview.removeFromSuperview()
                })
            } else {
                subview.removeFromSuperview()
            }
        }
    }
    
    func hasSubviewOf<T: UIView>(type: T.Type) -> Bool {
        guard getSubviewOf(type: type) != nil else {
            return false
        }
        return true
    }
    
    func getSubviewOf<T: UIView>(type: T.Type) -> UIView? {
        for subview in subviews where subview is T {
            return subview
        }
        return nil
    }
}
