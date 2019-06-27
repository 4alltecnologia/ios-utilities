//
//  CnpjValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Demetrius Martins Da Silva on 27/06/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum CnpjValidatorErrors: Error {
    case invalidMaskCnpjFormat
    case invalidCnpj
}

public final class CnpjValidator { }

extension CnpjValidator: ValidatorConvertible {
    public func validated(_ value: String) -> Result<String, Error> {
        do {
            if try NSRegularExpression(pattern: ValidatorsConstants.Regex.cnpj,
                                       options: .caseInsensitive).firstMatch(in: value,
                                                                             options: [],
                                                                             range: NSRange(location: 0,
                                                                                            length: value.count)) == nil {
                return .failure(CnpjValidatorErrors.invalidMaskCnpjFormat)
            }
            guard validateNumbersCNPJ(cnpj: value) else {
                return .failure(CnpjValidatorErrors.invalidCnpj)
            }
        } catch let error {
            return .failure(error)
        }
        return .success(value)
    }

    private func validateNumbersCNPJ(cnpj: String) -> Bool {
        let numbers = cnpj.compactMap({ Int(String($0)) })

        guard numbers.count == 14 && Set(numbers).count != 1 else { return false }

        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {

            var number = 1

            let digit = 11 - slice.reversed().reduce(into: 0) {

                number += 1

                $0 += $1 * number

                if number == 9 { number = 1 }

                } % 11

            return digit > 9 ? 0 : digit
        }

        let dv1 = digitCalculator(numbers.prefix(12))

        let dv2 = digitCalculator(numbers.prefix(13))

        return dv1 == numbers[12] && dv2 == numbers[13]
    }
}
