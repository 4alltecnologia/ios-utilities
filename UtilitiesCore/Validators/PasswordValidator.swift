//
//  PasswordValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 12/02/2019.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum PasswordValidatorErrors: Error {
    case invalidPassword
}

public final class PasswordValidator {
    private let regexPassword: String

    init(_ regex: String = ValidatorsConstants.Regex.password) {
        self.regexPassword = regex
    }
}

extension PasswordValidator: ValidatorConvertible {
    public func validated(_ value: String) -> Result<String, Error> {
        do {
            if try NSRegularExpression(pattern: regexPassword,
                                       options: .caseInsensitive).firstMatch(in: value,
                                                                             options: [],
                                                                             range: NSRange(location: 0,
                                                                                            length: value.count)) == nil {
                return .failure(PasswordValidatorErrors.invalidPassword)
            }
        } catch let error {
            return .failure(error)
        }

        return Result.success(value)
    }
}
