//
//  CpfValidator.swift
//  UtilitiesCore
//
//  Created by Felipe Demetrius Martins Da Silva on 27/06/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum CpfValidatorErrors: Error {
    case invalidMaskCpfFormat
    case invalidCpf
}

public final class CpfValidator { }

extension CpfValidator: ValidatorConvertible {
    public func validated(_ value: String) -> Result<String, Error> {
        do {
            if try NSRegularExpression(pattern: ValidatorsConstants.Regex.cpf,
                                       options: .caseInsensitive).firstMatch(in: value,
                                                                             options: [],
                                                                             range: NSRange(location: 0,
                                                                                            length: value.count)) == nil {
                return .failure(CpfValidatorErrors.invalidMaskCpfFormat)
            }
            guard validateNumbersCPF(cpf: value) else {
                return .failure(CpfValidatorErrors.invalidCpf)
            }
        } catch let error {
            return .failure(error)
        }
        return .success(value)
    }

    private func validateNumbersCPF(cpf: String) -> Bool {
        let numbers = cpf.compactMap( { Int(String($0)) } )

        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }

        let soma1 = 11 - ( numbers[0] * 10 +
            numbers[1] * 9 +
            numbers[2] * 8 +
            numbers[3] * 7 +
            numbers[4] * 6 +
            numbers[5] * 5 +
            numbers[6] * 4 +
            numbers[7] * 3 +
            numbers[8] * 2 ) % 11

        let dv1 = soma1 > 9 ? 0 : soma1

        let soma2 = 11 - ( numbers[0] * 11 +
            numbers[1] * 10 +
            numbers[2] * 9 +
            numbers[3] * 8 +
            numbers[4] * 7 +
            numbers[5] * 6 +
            numbers[6] * 5 +
            numbers[7] * 4 +
            numbers[8] * 3 +
            numbers[9] * 2 ) % 11

        let dv2 = soma2 > 9 ? 0 : soma2

        return dv1 == numbers[9] && dv2 == numbers[10]
    }
}
