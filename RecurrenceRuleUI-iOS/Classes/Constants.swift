//
//  Constants.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import UIKit
import EventKit
import RecurrenceRule_iOS

internal struct CellID {
    static let CommonCell = "CommonCell"
    static let BasicRecurrenceCell = "BasicRecurrenceCell"
    static let CustomRecurrenceViewCell = "CustomRecurrenceViewCell"
    static let PickerViewCell = "PickerViewCell"
    static let SelectorItemCell = "SelectorItemCell"
    static let MonthOrDaySelectorCell = "MonthOrDaySelectorCell"
}

internal struct Constant {
    static let DefaultRowHeight: CGFloat = 44
    static let PickerViewCellHeight: CGFloat = 215
    static let PickerRowHeight: CGFloat = 40
    static let PickerMaxRowCount = 999
    static let DetailTextColor = UIColor.grayColor()

    static let SelectorVerticalPadding: CGFloat = 1
    static let GridLineWidth: CGFloat = 0.5
    static let GridLineColor = UIColor(white: 187.0 / 255.0, alpha: 1)
    static let GridLineName = "RecurrencePicker.GridSelectorViewGridLine"
}

internal extension Constant {
    static var frequencies: [RecurrenceFrequency] {
        return [.Daily, .Weekly, .Monthly, .Yearly]
    }
    static var weekdays: [EKWeekday] {
        return [EKWeekday.Monday, EKWeekday.Tuesday, EKWeekday.Wednesday, EKWeekday.Thursday, EKWeekday.Friday, EKWeekday.Saturday, EKWeekday.Sunday]
    }
    static func weekdaySymbols(language language: RecurrencePickerLanguage = InternationalControl.sharedControl.language) -> [String] {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: language.identifier)
        var weekdaySymbols = dateFormatter.weekdaySymbols
        weekdaySymbols.insert(weekdaySymbols.removeAtIndex(0), atIndex: 6)
        return weekdaySymbols
    }

    static func shortMonthSymbols(language language: RecurrencePickerLanguage = InternationalControl.sharedControl.language) -> [String] {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: language.identifier)
        return dateFormatter.shortMonthSymbols
    }

    static func monthSymbols(language language: RecurrencePickerLanguage = InternationalControl.sharedControl.language) -> [String] {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: language.identifier)
        return dateFormatter.monthSymbols
    }

    static func basicRecurrenceStrings(language language: RecurrencePickerLanguage = InternationalControl.sharedControl.language) -> [String] {
        let internationalControl = InternationalControl(language: language)
        return [internationalControl.localizedString(key: "PresetRecurrenceRuleText.Never"),
                internationalControl.localizedString(key: "PresetRecurrenceRuleText.EveryDay"),
                internationalControl.localizedString(key: "PresetRecurrenceRuleText.EveryWeek"),
                internationalControl.localizedString(key: "PresetRecurrenceRuleText.EveryTwoWeeks"),
                internationalControl.localizedString(key: "PresetRecurrenceRuleText.EveryMonth"),
                internationalControl.localizedString(key: "PresetRecurrenceRuleText.EveryYear"),
                internationalControl.localizedString(key: "PresetRecurrenceRuleText.EveryWeekday"),]
    }

    static func frequencyStrings(language language: RecurrencePickerLanguage = InternationalControl.sharedControl.language) -> [String] {
        let internationalControl = InternationalControl(language: language)
        return [internationalControl.localizedString(key: "PickerFrequency.Daily"),
                internationalControl.localizedString(key: "PickerFrequency.Weekly"),
                internationalControl.localizedString(key: "PickerFrequency.Monthly"),
                internationalControl.localizedString(key: "PickerFrequency.Yearly"),]
    }

    static func unitStrings(language language: RecurrencePickerLanguage = InternationalControl.sharedControl.language) -> [String] {
        let internationalControl = InternationalControl(language: language)
        return [internationalControl.localizedString(key: "PickerFrequencyUnit.Day"),
                internationalControl.localizedString(key: "PickerFrequencyUnit.Week"),
                internationalControl.localizedString(key: "PickerFrequencyUnit.Month"),
                internationalControl.localizedString(key: "PickerFrequencyUnit.Year"),]
    }

    static func pluralUnitStrings(language language: RecurrencePickerLanguage = InternationalControl.sharedControl.language) -> [String] {
        let internationalControl = InternationalControl(language: language)
        return [internationalControl.localizedString(key: "PluralPickerFrequencyUnit.Day"),
                internationalControl.localizedString(key: "PluralPickerFrequencyUnit.Week"),
                internationalControl.localizedString(key: "PluralPickerFrequencyUnit.Month"),
                internationalControl.localizedString(key: "PluralPickerFrequencyUnit.Year"),]
    }
}
