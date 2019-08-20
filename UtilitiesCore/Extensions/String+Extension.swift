//
//  String.swift
//  UtilitiesCore
//
//  Created by Gabriel Miranda Silveira on 16/11/18.
//  Copyright © 2018 4all. All rights reserved.
//

import Foundation

// MARK: - General
public extension String {
    /// Returns a String containing only numbers or an empty String
    var numbersOnly: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    /// Verify if the string has one or more numbers
    var hasNumbers: Bool {
        return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
    }
    
    /// Verify if the string has only numbers
    var hasOnlyNumbers: Bool {
        return rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    /// Returns a String containing only letters or an empty String
    var lettersOnly: String {
        return components(separatedBy: CharacterSet.letters.inverted).joined()
    }
    
    /// Verify if the string has one or more letters
    var hasLetters: Bool {
        return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    
    /// Verify if the string has only letters
    var hasOnlyLetters: Bool {
        return rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    }
    
    /// Verify if the string contains at least one letter and one number
    var isAlphaNumeric: Bool {
        let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
        let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
        let comps = components(separatedBy: .alphanumerics)
        return comps.joined(separator: "").isEmpty && hasLetters && hasNumbers
    }
    
    /// Returns a String removing all whitespaces, not only the leading/trailing but also in the middle of the string
    var removingWhitespaces: String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    /// Returns a String removing the leading/trailing whitespaces and new lines
    var trimmingWhitespacesAndNewLines: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

}

// MARK: - Localized
public extension String {
    
    /// Returns localized string from key.
    ///
    /// - Returns: NSLocalizedString
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

// MARK: - Date
public extension String {
    /// Get Date from string.
    ///
    /// - Parameters:
    ///   - inputFormat: String's input format. Example: "23/04/2014" is "dd/MM/yyyy"
    ///   - timezone: TimeZone for the date. If none is passed, the device's locale is used.
    /// - Returns: Date
    func getDate(withInputFormat inputFormat: String, andTimezone timezone: TimeZone? = nil) -> Date? {
        let dateFormatter = DateFormatter()
        if let zone = timezone {
            dateFormatter.timeZone = zone
        }
        dateFormatter.dateFormat = inputFormat
        return dateFormatter.date(from: self)
    }
    
    /// Transform String date from one format to another
    ///
    /// - Parameters:
    ///   - receivingFormat: actual string date format
    ///   - transforming: new date format
    /// - Returns: String with the new format or nil if fail
    func transformDateFormat(_ receivingFormat: String, new transforming: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = receivingFormat
        let date = dateFormatter.date(from: self)
        
        dateFormatter.dateFormat = transforming
        
        guard let unDate = date else { return nil }
        let stringFormatted = dateFormatter.string(from: unDate)
        
        return stringFormatted
    }
}

// MARK: - Dictionary
public extension String {
    /// Dictionary from string JSON format
    var toDictionary: [String: Any] {
        if let data = data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
            } catch {
                return [:]
            }
        }
        return [:]
    }
}

// MARK: - Currency
public extension String {
    /// Get number if string is brazilian currency or return nil
    var brazilianCurrencyNumber: NSNumber? {
        let formatter = NumberFormatter.brazilianCurrencyFormatter

        guard let value = formatter.number(from: self) else {
            return nil
        }
        return value
    }

    /// Get price String amount in cents
    var amountCentsFormat: Int? {
        let value = self.replacingOccurrences(of: "R$ ", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: ",", with: "")
            .trimmingCharacters(in: .whitespaces)
        guard !value.isEmpty else {
            return nil
        }
        return Int(value)
    }

    // Formatting text for currency textField
    var textFieldCurrencyFormat: String? {
        let formatter = NumberFormatter.brazilianCurrencyFormatter
        var amountWithPrefix = self
        
        do {
            // remove from String: "$", ".", ","
            let regex = try NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
            amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix,
                                                              options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                                              range: NSRange(location: 0, length: count),
                                                              withTemplate: "")
        } catch {
            return nil
        }
        
        let double = (amountWithPrefix as NSString).doubleValue
        let number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 else { return nil }
        return formatter.string(from: number) ?? nil
    }
}

// MARK: - Html
public extension String {
    
    /// Transform string in html format to NSAttributedString with the layout of html
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                                                                .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    /// Transform string in html format to NSMutableAttributedString using font and color attributes passed as parameter.
    ///
    /// - Parameters:
    ///   - font: UIFont to be used.
    ///   - fontSize: CGFloat for the UIFont's size.
    ///   - color: UIColor to be used.
    /// - Returns: NSMutableAttributedString
    func htmlAttributed(using font: String, fontSize: CGFloat, color: UIColor) -> NSMutableAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(fontSize)pt !important;" +
                "color: #\(color.hexString ?? "#000") !important;" +
                "font-family: \(font), Helvetica !important;" +
                "text-align: center;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSMutableAttributedString(data: data,
                                                 options: [.documentType: NSAttributedString.DocumentType.html,
                                                           .characterEncoding: String.Encoding.utf8.rawValue],
                                                 documentAttributes: nil)
        } catch {
            return nil
        }
    }
}

// MARK: - Range
public extension String {
    
    /// Create a substring based on the range passed
    ///
    /// - Parameter range: range to create the substring
    subscript (range: Range<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    subscript(range: CountableClosedRange<Int>) -> Substring {
        return self[index(at: range.lowerBound)...index(at: range.upperBound)]
    }
    
    subscript(range: PartialRangeUpTo<Int>) -> Substring {
        return self[..<index(at: range.upperBound)]
    }
    
    subscript(range: PartialRangeThrough<Int>) -> Substring {
        return self[...index(at: range.upperBound)]
    }
    
    subscript(range: PartialRangeFrom<Int>) -> Substring {
        return self[index(at: range.lowerBound)...]
    }
    
    internal func index(at offset: Int) -> String.Index {
        return index(startIndex, offsetBy: offset)
    }
}
