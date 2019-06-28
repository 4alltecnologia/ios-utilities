//
//  UITextField+Extension.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 08/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

extension UITextField {

    /// This functions is used to validate the textField.text
    /// with the validation functions also created in this framework
    ///
    /// - Parameter validationType: the validatorType to perform the validation
    /// - Returns: a swift 5 result type with error or the .text content string of self
    func validatedText(validationType: ValidatorType) -> Result<String, Error> {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return validator.validated(self.text ?? "")
    }
}
