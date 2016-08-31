//
//  RecurrenceRule+Generator.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import Foundation
import EventKit
import RecurrenceRule_iOS

public extension RecurrenceRule {
    public static func dailyRecurrence() -> RecurrenceRule {
        var recurrenceRule = RecurrenceRule(frequency: .Daily)
        recurrenceRule.interval = 1
        return recurrenceRule
    }

    public static func weekdayRecurrence() -> RecurrenceRule {
        var recurrenceRule = RecurrenceRule(frequency: .Weekly)
        recurrenceRule.interval = 1
        recurrenceRule.byweekday = [.Monday, .Tuesday, .Wednesday, .Thursday, .Friday]
        return recurrenceRule
    }

    public static func weeklyRecurrence(weekday weekday: EKWeekday) -> RecurrenceRule {
        var recurrenceRule = RecurrenceRule(frequency: .Weekly)
        recurrenceRule.interval = 1
        recurrenceRule.byweekday = [weekday]
        return recurrenceRule
    }

    public static func biWeeklyRecurrence(weekday weekday: EKWeekday) -> RecurrenceRule {
        var recurrenceRule = RecurrenceRule(frequency: .Weekly)
        recurrenceRule.interval = 2
        recurrenceRule.byweekday = [weekday]
        return recurrenceRule
    }

    public static func monthlyRecurrence(monthday monthday: Int) -> RecurrenceRule {
        var recurrenceRule = RecurrenceRule(frequency: .Monthly)
        recurrenceRule.interval = 1
        if (-31...31 ~= monthday) && (monthday != 0) {
            recurrenceRule.bymonthday = [monthday]
        }
        return recurrenceRule
    }

    public static func yearlyRecurrence(month month: Int) -> RecurrenceRule {
        var recurrenceRule = RecurrenceRule(frequency: .Yearly)
        recurrenceRule.interval = 1
        if 1...12 ~= month {
            recurrenceRule.bymonth = [month]
        }
        return recurrenceRule
    }
}
