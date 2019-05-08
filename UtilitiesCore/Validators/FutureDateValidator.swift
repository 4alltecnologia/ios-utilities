//
//  FutureDateValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 24/04/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum FutureDateValidatorErrors: Error {
    case invalidDate, datePastThanToday
}

public final class FutureDateValidator {
    private let dateFormatter: DateFormatter

    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
}

extension FutureDateValidator: ValidatorConvertible {
    public func validated(_ value: String) -> Result<String, Error> {
        guard let date = dateFormatter.date(from: value) else {
            return .failure(FutureDateValidatorErrors.invalidDate)
        }

        let now = Date()

        if date <= now || Calendar.current.isDateInToday(date) {
            return .failure(FutureDateValidatorErrors.datePastThanToday)
        }

        return .success(value)
    }
}
