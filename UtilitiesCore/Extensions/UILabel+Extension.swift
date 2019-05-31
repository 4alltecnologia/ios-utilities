//
//  UILabel+Extension.swift
//  UtilitiesCore
//
//  Created by Gabriel Miranda Silveira on 31/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

enum FontType {
    //Add all your custom fonts here
    case system, boldSystem, italicSystem
    
    func font(size: CGFloat) -> UIFont {
        switch self {
        case .system: return UIFont.systemFont(ofSize: size)
        case .boldSystem: return UIFont.systemFont(ofSize: size)
        case .italicSystem: return UIFont.italicSystemFont(ofSize: size)
        }
    }
}

extension UILabel {
    convenience init(fontType: FontType = .system,
                     alignment: NSTextAlignment = .left,
                     size: CGFloat,
                     textColor: UIColor = .black,
                     text: String = "") {
        self.init()
        self.textAlignment = alignment
        self.textColor = textColor
        self.font = fontType.font(size: size)
        self.text = text
    }
}
