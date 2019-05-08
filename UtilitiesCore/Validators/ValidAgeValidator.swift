//
//  ValidAgeValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 12/02/2019.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum ValidAgeValidatorErrors: Error {
    case invalidDateFormatt, ageBiggerThan140Years, ageShouldBeBiggerThan0
}

public final class ValidAgeValidator {
    private let ageValidatorDateFormatter: DateFormatter
    private let yearsInDays = 51100  //140 years

    init(dateFormatter: DateFormatter) {
        ageValidatorDateFormatter = dateFormatter
    }
}

extension ValidAgeValidator: ValidatorConvertible {
    public func validated(_ value: String) -> Result<String, Error> {
        let calendar = Calendar.current
        let now = Date()
        guard let birthday = ageValidatorDateFormatter.date(from: value) else {
            return .failure(ValidAgeValidatorErrors.invalidDateFormatt)
        }

        guard let days = calendar.dateComponents([.day], from: birthday, to: now).day else {
            return .failure(ValidAgeValidatorErrors.invalidDateFormatt)
        }

        guard days <= yearsInDays else { return .failure(ValidAgeValidatorErrors.ageBiggerThan140Years) }
        guard days > 0 else { return .failure(ValidAgeValidatorErrors.ageShouldBeBiggerThan0) }

        return Result.success(value)
    }
}
