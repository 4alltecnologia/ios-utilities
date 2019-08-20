//
//  SystemInfo.swift
//  UtilitiesCore
//
//  Created by Luca Saldanha Schifino on 20/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public class SystemInfo {
    
    public static var deviceName: String {
        return UIDevice.current.name
    }
    
    public static var systemName: String {
        return UIDevice.current.systemName
    }
    
    public static var systemVersion: String {
        return UIDevice.current.systemVersion
    }
    
    public static var deviceUUID: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    public static var bundleVersion: String? {
        guard let dictionary = Bundle.main.infoDictionary,
            let build = dictionary["CFBundleVersion"] as? String else {
            return nil
        }
        return build
    }
    
    public static var appVersion: String? {
        guard let dictionary = Bundle.main.infoDictionary,
            let version = dictionary["CFBundleShortVersionString"] as? String else {
                return nil
        }
        return version
    }
}
