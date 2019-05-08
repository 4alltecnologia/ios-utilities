//
//  RequiredFieldValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 07/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum RequiredFieldError: Error {
    case fieldRequiredWith(name: String)
    case fieldRequired
}

extension RequiredFieldError: Equatable { }

public class RequiredFieldValidator: ValidatorConvertible {
    private let fieldName: String?

    init(_ fieldName: String? = nil) {
        self.fieldName = fieldName
    }

    public func validated(_ value: String) -> Result<String, Error> {
        guard !value.isEmpty else {
            if let fieldName = fieldName {
                return .failure(RequiredFieldError.fieldRequiredWith(name: fieldName))
            } else {
                return .failure(RequiredFieldError.fieldRequired)
            }
        }
        return .success(value)
    }
}
