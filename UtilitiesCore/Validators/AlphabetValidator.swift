//
//  AlphabetValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 13/03/2019.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum AlphabetValidatorErrors: Error {
    case invalidAlphabetCharacter
}

public final class AlphabetValidator { }

extension AlphabetValidator: ValidatorConvertible {
    public func validated(_ value: String) -> Result<String, Error> {
        do {
            if try NSRegularExpression(pattern: ValidatorsConstants.Regex.alphabet,
                                       options: .caseInsensitive).firstMatch(in: value,
                                                                             options: [],
                                                                             range: NSRange(location: 0,
                                                                                            length: value.count)) == nil {
                return .failure(AlphabetValidatorErrors.invalidAlphabetCharacter)
            }
        } catch let error {
            return .failure(error)
        }
        return Result.success(value)
    }
}
