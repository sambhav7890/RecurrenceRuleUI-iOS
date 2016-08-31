//
//  RecurrenceRule+Text.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import Foundation
import RecurrenceRule_iOS

public extension RecurrenceRule {
    public func toText(language language: RecurrencePickerLanguage = InternationalControl.sharedControl.language, occurrenceDate: NSDate) -> String? {
        let internationalControl = InternationalControl(language: language)
        let unit = Constant.unitStrings(language: language)[frequency.number]
        let pluralUnit = Constant.pluralUnitStrings(language: language)[frequency.number]

        let unitString: String = {
            var unitString: String
			if interval == 1 {
				unitString = unit
			} else {
				if language == .English {
					unitString = "\(interval)" + " " + pluralUnit
				} else {
					unitString = "\(interval)" + pluralUnit
				}
			}
            return unitString.lowercaseString
        }()

        switch frequency {
        case .Daily:
            return String(format: internationalControl.localizedString(key: "RecurrenceRuleText.BasicRecurrence"), unitString)

        case .Weekly:
            let byweekday = self.byweekday.sort(<)
            guard byweekday.count > 0 else {
                return nil
            }

            if isWeekdayRecurrence() {
                return internationalControl.localizedString(key: "RecurrenceRuleText.EveryWeekday")
            } else if interval == 1 && byweekday == [.Monday, .Tuesday, .Wednesday, .Thursday, .Friday, .Saturday, .Sunday].sort(<) {
                return RecurrenceRule(frequency: .Daily).toText(language: language, occurrenceDate: occurrenceDate)
            } else if byweekday.count == 1 && calendar.components([.Weekday], fromDate: occurrenceDate).weekday == byweekday.first!.rawValue {
                return String(format: internationalControl.localizedString(key: "RecurrenceRuleText.BasicRecurrence"), unitString)
            } else {
                var weekdaysString: String

				weekdaysString = internationalControl.localizedString(key: "RecurrenceRuleText.Element.On.Weekly") + " " + Constant.weekdaySymbols(language: language)[byweekday.first!.number]

                for index in 1..<byweekday.count {
                    var prefixString: String
                    if index == byweekday.count - 1 {
                        prefixString = " " + internationalControl.localizedString(key: "RecurrenceRuleText.Element.And")
                    } else {
                        prefixString = internationalControl.localizedString(key: "RecurrenceRuleText.Element.Comma")
                    }
                    weekdaysString += prefixString + " " + Constant.weekdaySymbols(language: language)[byweekday[index].number]
                }

                return String(format: internationalControl.localizedString(key: "RecurrenceRuleText.ByWeekdaysOrMonthdaysOrMonths"), unitString, weekdaysString)
            }

        case .Monthly:
            let bymonthday = self.bymonthday.sort(<)
            guard bymonthday.count > 0 else {
                return nil
            }

            if bymonthday.count == 1 && calendar.components([.Day], fromDate: occurrenceDate).day == bymonthday.first! {
                return String(format: internationalControl.localizedString(key: "RecurrenceRuleText.BasicRecurrence"), unitString)
            } else {
                var monthdaysString: String

				monthdaysString = internationalControl.localizedString(key: "RecurrenceRuleText.Element.On.Monthly") + " " + String.sequenceNumberString(bymonthday.first!)

                for index in 1..<bymonthday.count {
                    var prefixStr: String
                    if index == bymonthday.count - 1 {
                        prefixStr = " " + internationalControl.localizedString(key: "RecurrenceRuleText.Element.And")
                    } else {
                        prefixStr = internationalControl.localizedString(key: "RecurrenceRuleText.Element.Comma")
                    }

                    if language == .English {
                        monthdaysString += prefixStr + " " + String.sequenceNumberString(bymonthday[index])
                    } else {
                        monthdaysString += prefixStr + " " + String(format: internationalControl.localizedString(key: "RecurrenceRuleText.Element.Day"), bymonthday[index])
                    }
                }

                return String(format: internationalControl.localizedString(key: "RecurrenceRuleText.ByWeekdaysOrMonthdaysOrMonths"), unitString, monthdaysString)
            }

        case .Yearly:
            let bymonth = self.bymonth.sort(<)
            guard bymonth.count > 0 else {
                return nil
            }

            if bymonth.count == 1 && calendar.components([.Month], fromDate: occurrenceDate).month == bymonth.first! {
                return String(format: internationalControl.localizedString(key: "RecurrenceRuleText.BasicRecurrence"), unitString)
            } else {
                var monthsString: String

				monthsString = internationalControl.localizedString(key: "RecurrenceRuleText.Element.On.Yearly") + " " + Constant.monthSymbols(language: language)[bymonth.first! - 1]

                for index in 1..<bymonth.count {
                    var prefixStr: String
                    if index == bymonth.count - 1 {
                        prefixStr = " " + internationalControl.localizedString(key: "RecurrenceRuleText.Element.And")
                    } else {
                        prefixStr = internationalControl.localizedString(key: "RecurrenceRuleText.Element.Comma")
                    }

                    if language == .English {
                        monthsString += prefixStr + " " + Constant.monthSymbols(language: language)[bymonth[index] - 1]
                    } else {
                        monthsString += prefixStr + " " + Constant.shortMonthSymbols(language: language)[bymonth[index] - 1]
                    }
                }

                return String(format: internationalControl.localizedString(key: "RecurrenceRuleText.ByWeekdaysOrMonthdaysOrMonths"), unitString, monthsString)
            }

        default:
            return nil
        }
    }
}
