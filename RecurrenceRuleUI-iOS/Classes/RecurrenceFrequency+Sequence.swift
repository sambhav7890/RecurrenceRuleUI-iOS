//
//  RecurrenceFrequency+Sequence.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import Foundation
import RecurrenceRule_iOS

internal extension RecurrenceFrequency {
    internal var number: Int {
        switch self {
        case .Daily: return 0
        case .Weekly: return 1
        case .Monthly: return 2
        case .Yearly: return 3
        case .Hourly: return 4
        case .Minutely: return 5
        case .Secondly: return 6
        }
    }
}
