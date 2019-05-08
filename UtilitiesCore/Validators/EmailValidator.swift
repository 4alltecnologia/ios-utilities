//
//  EmailValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 12/02/2019.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum EmailValidatorErrors: Error {
    case invalidEmailFormatt
}

public final class EmailValidator { }

extension EmailValidator: ValidatorConvertible {
    public func validated(_ value: String) -> Result<String, Error> {
        do {
            if try NSRegularExpression(pattern: ValidatorsConstants.Regex.email,
                                       options: .caseInsensitive).firstMatch(in: value,
                                                                             options: [],
                                                                             range: NSRange(location: 0,
                                                                                            length: value.count)) == nil {
                return .failure(EmailValidatorErrors.invalidEmailFormatt)
            }
        } catch let error {
            return .failure(error)
        }
        return .success(value)
    }
}
