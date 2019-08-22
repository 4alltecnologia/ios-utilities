//
//  UIFont+Extension.swift
//  UtilitiesCore
//
//  Created by Betina Pereira de Farias on 27/11/18.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension UIFont {
    
    /// Returns an specific UIFont for a family and size. If none is found, returns the system font.
    ///
    /// - Parameters:
    ///   - family: Font family. Example: "Montserrat-Bold"
    ///   - size: CGFloat for UIFont's size
    /// - Returns: UIFont
    static func font(ofFamily family: String, withSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: family, size: size) else {
            return .systemFont(ofSize: size)
        }
        return font
    }
}
