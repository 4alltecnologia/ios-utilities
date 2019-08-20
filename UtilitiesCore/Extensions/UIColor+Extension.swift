//
//  UIColor+Extension.swift
//  UtilitiesCore
//
//  Created by Betina Pereira de Farias on 27/11/18.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension UIColor {
    
    /// UIColor's current hex String.
    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return String(
            format: "%02X%02X%02X",
            Int(red * 0xff),
            Int(green * 0xff),
            Int(blue * 0xff)
        )
    }
    
    /// Gets an UIColor from a hex String.
    ///
    /// - Parameter hex: String containing the hex value.
    /// - Returns: UIColor
    static func hexStringToColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
