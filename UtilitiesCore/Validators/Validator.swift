//
//  File.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 12/02/2019.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public typealias ValidationFunction = (_ value: String) -> Result<String, Error>

public protocol ValidatorConvertible {
    func validated(_ value: String) -> Result<String, Error>
}

public enum ValidatorType {
    case requiredField(field: String)
    case email
    case validAge(dateFormatter: DateFormatter)
    case password
    case futureDate(dateFormatter: DateFormatter)
    case alphabet
    case custom(validation: ValidationFunction)
}

public enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName)
        case .email: return EmailValidator()
        case .validAge(let dateFormatter): return ValidAgeValidator(dateFormatter: dateFormatter)
        case .password: return PasswordValidator()
        case .alphabet: return AlphabetValidator()
        case .futureDate(let dateFormatter): return FutureDateValidator(dateFormatter: dateFormatter)
        case .custom(let validationFunction): return CustomValidator(validationFunction: validationFunction)
        }
    }
}

public struct ValidatorsConstants {
    struct Regex {
        static let email = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        static let password = "^(?=.*\\d)(?=.*[a-zA-Z]).{8,}$"
        static let alphabet = "(?i)^(?:(?![×Þß÷þø])[-' a-zÀ-ÿ])+$"
    }
}
