//
//  NibRegistrableView.swift
//  UtilitiesCore
//
//  Created by Luca Saldanha Schifino on 20/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public protocol NibRegistrableView: UIView {
    static var nibName: String { get }
    static var reuseId: String { get }
}

public extension NibRegistrableView {
    static var nibName: String { return  Self.className }
    static var reuseId: String { return  Self.className }
    static var nib: UINib { return UINib(nibName: nibName, bundle: Bundle(for: self)) }
    
    static func instantiateFromNib() -> Self? {
        return self.nib.instantiate(withOwner: nil, options: nil).first as? Self
    }
}

public typealias NibRegistrableTableViewCell = NibRegistrableView & UITableViewCell
public typealias NibRegistrableCollectionViewCell = NibRegistrableView & UICollectionViewCell
public typealias NibRegistrableTableViewHeaderFooterView = NibRegistrableView & UITableViewHeaderFooterView

public extension UITableView {
    func registerNib(for cellClass: NibRegistrableTableViewCell.Type) {
        register(cellClass.nib, forCellReuseIdentifier: cellClass.reuseId)
    }
    
    func registerHeaderNib(for headerFooterClass: NibRegistrableTableViewHeaderFooterView.Type) {
        register(headerFooterClass.nib, forHeaderFooterViewReuseIdentifier: headerFooterClass.reuseId)
    }
    
    func dequeueReusableCell<T: NibRegistrableTableViewCell>() -> T? {
        return dequeueReusableCell(withIdentifier: T.reuseId) as? T
    }
    
    func dequeueReusableHeaderFooter<T: NibRegistrableTableViewHeaderFooterView>() -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: T.reuseId) as? T
    }
}

public extension UICollectionView {
    func registerNib(for cellClass: NibRegistrableCollectionViewCell.Type) {
        register(cellClass.nib, forCellWithReuseIdentifier: cellClass.reuseId)
    }
    
    func dequeueReusableCell<T: NibRegistrableCollectionViewCell>(for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as? T
    }
}
