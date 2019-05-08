//
//  CustomValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 07/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public final class CustomValidator {
    private let validationFunction: ValidationFunction

    init(validationFunction: @escaping ValidationFunction) {
        self.validationFunction = validationFunction
    }
}

extension CustomValidator: ValidatorConvertible {
    public func validated(_ value: String) -> Result<String, Error> {
        return validationFunction(value)
    }
}
