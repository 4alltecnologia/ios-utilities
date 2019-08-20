//
//  UILabel+Extension.swift
//  UtilitiesCore
//
//  Created by Betina Pereira de Farias on 28/11/18.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension UILabel {
    
    /// Adds spacing in between charactes.
    ///
    /// - Parameter value: Float for spacing. Default: 3
    func addCharacterSpacing(_ value: Float = 3) {
        if let text = self.text, !text.isEmpty {
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(.kern, value: value, range: .init(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
    }
}
