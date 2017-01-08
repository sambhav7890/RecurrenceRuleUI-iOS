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
    static let DetailTextColor = UIColor.gray

    static let SelectorVerticalPadding: CGFloat = 1
    static let GridLineWidth: CGFloat = 0.5
    static let GridLineColor = UIColor(white: 187.0 / 255.0, alpha: 1)
    static let GridLineName = "RecurrencePicker.GridSelectorViewGridLine"
}

internal extension Constant {
    static var frequencies: [RecurrenceFrequency] {
        return [.daily, .weekly, .monthly, .yearly]
    }
    static var weekdays: [EKWeekday] {
        return [EKWeekday.monday, EKWeekday.tuesday, EKWeekday.wednesday, EKWeekday.thursday, EKWeekday.friday, EKWeekday.saturday, EKWeekday.sunday]
    }
    static func weekdaySymbols() -> [String] {
        let dateFormatter = DateFormatter()
		let identifier = InternationalControl.sharedControl.language.identifier
        dateFormatter.locale = Locale(identifier: identifier)
		guard var weekdaySymbols = dateFormatter.weekdaySymbols else { return [] }
        weekdaySymbols.insert(weekdaySymbols.remove(at: 0), at: 6)
        return weekdaySymbols
    }

    static func shortMonthSymbols() -> [String] {
        let dateFormatter = DateFormatter()
		let identifier = InternationalControl.sharedControl.language.identifier
        dateFormatter.locale = Locale(identifier: identifier)
        return dateFormatter.shortMonthSymbols
    }

    static func monthSymbols() -> [String] {
        let dateFormatter = DateFormatter()
		let identifier = InternationalControl.sharedControl.language.identifier
        dateFormatter.locale = Locale(identifier: identifier)
        return dateFormatter.monthSymbols
    }

    static func basicRecurrenceStrings() -> [String] {
        let internationalControl = InternationalControl.sharedControl
        return [internationalControl.localizedString("PresetRecurrenceRuleText.Never"),
                internationalControl.localizedString("PresetRecurrenceRuleText.EveryDay"),
                internationalControl.localizedString("PresetRecurrenceRuleText.EveryWeek"),
                internationalControl.localizedString("PresetRecurrenceRuleText.EveryTwoWeeks"),
                internationalControl.localizedString("PresetRecurrenceRuleText.EveryMonth"),
                internationalControl.localizedString("PresetRecurrenceRuleText.EveryYear"),
                internationalControl.localizedString("PresetRecurrenceRuleText.EveryWeekday")]
    }

    static func frequencyStrings() -> [String] {
        let internationalControl = InternationalControl.sharedControl
        return [internationalControl.localizedString("PickerFrequency.Daily"),
                internationalControl.localizedString("PickerFrequency.Weekly"),
                internationalControl.localizedString("PickerFrequency.Monthly"),
                internationalControl.localizedString("PickerFrequency.Yearly"),]
    }

    static func unitStrings() -> [String] {
        let internationalControl = InternationalControl.sharedControl
        return [internationalControl.localizedString("PickerFrequencyUnit.Day"),
                internationalControl.localizedString("PickerFrequencyUnit.Week"),
                internationalControl.localizedString("PickerFrequencyUnit.Month"),
                internationalControl.localizedString("PickerFrequencyUnit.Year"),]
    }

    static func pluralUnitStrings() -> [String] {
        let internationalControl = InternationalControl.sharedControl
        return [internationalControl.localizedString("PluralPickerFrequencyUnit.Day"),
                internationalControl.localizedString("PluralPickerFrequencyUnit.Week"),
                internationalControl.localizedString("PluralPickerFrequencyUnit.Month"),
                internationalControl.localizedString("PluralPickerFrequencyUnit.Year"),]
    }
}
