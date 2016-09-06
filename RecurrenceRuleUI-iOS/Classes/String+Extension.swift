//
//  String+Extension.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import Foundation

internal extension String {
    internal mutating func removeSubstring(substring: String) {
        self = stringByReplacingOccurrencesOfString(substring, withString: "", options: .LiteralSearch, range: nil)
    }

    internal static func sequenceNumberString(number: Int) -> String {
        var suffix = "th"
        let ones = number % 10
        let tens = (number / 10) % 10

        if tens == 1 {
            suffix = "th"
        } else if ones == 1 {
            suffix = "st"
        } else if ones == 2 {
            suffix = "nd"
        } else if ones == 3 {
            suffix = "rd"
        } else {
            suffix = "th"
        }
        return "\(number)\(suffix)"
    }
}
