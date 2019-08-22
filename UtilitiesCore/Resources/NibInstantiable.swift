//
//  NibInstantiable.swift
//  UtilitiesCore
//
//  Created by Luca Saldanha Schifino on 20/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public protocol NibInstantiatable {
    static func instantiateFromNib(bundle: Bundle?) -> Self?
}

public extension NibInstantiatable where Self: UIView {
    static func instantiateFromNib(bundle: Bundle?) -> Self? {
        let nibName = Self.className
        let arrayViews =  UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: nil, options: nil)
        return arrayViews.first as? Self
    }
}
