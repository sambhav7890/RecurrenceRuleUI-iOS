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
	public func toText(on occurrenceDate: Date) -> String? {

        let internationalControl = InternationalControl.sharedControl
        let unit = Constant.unitStrings()[frequency.number]
        let pluralUnit = Constant.pluralUnitStrings()[frequency.number]

        let unitString: String = {
            var unitString: String
			if let ival = interval, ival != 1 {
				unitString = "\(ival)"
				if internationalControl.language == .english {
					unitString.append(" ")
				}
				unitString.append(pluralUnit)
			} else {
				unitString = unit
			}
            return unitString.lowercased()
        }()

        switch frequency {
        case .daily:
            return String(format: internationalControl.localizedString("RecurrenceRuleText.BasicRecurrence"), unitString)

        case .weekly:
			let byweekday = self.byweekday.sorted(by: <)
            guard byweekday.count > 0 else {
                return nil
            }

            if isWeekdayRecurrence() {
                return internationalControl.localizedString("RecurrenceRuleText.EveryWeekday")
            } else if interval == 1 && byweekday == [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday].sorted(by: <) {
                return RecurrenceRule(frequency: .daily).toText(on: occurrenceDate)
            } else if byweekday.count == 1 && calendar.dateComponents([.weekday], from: occurrenceDate).weekday == byweekday.first!.rawValue {
                return String(format: internationalControl.localizedString("RecurrenceRuleText.BasicRecurrence"), unitString)
            } else {
                var weekdaysString: String

				weekdaysString = internationalControl.localizedString("RecurrenceRuleText.Element.On.Weekly") + " " + Constant.weekdaySymbols()[byweekday.first!.number]

                for index in 1..<byweekday.count {
                    var prefixString: String
                    if index == byweekday.count - 1 {
                        prefixString = " " + internationalControl.localizedString("RecurrenceRuleText.Element.And")
                    } else {
                        prefixString = internationalControl.localizedString("RecurrenceRuleText.Element.Comma")
                    }
                    weekdaysString += prefixString + " " + Constant.weekdaySymbols()[byweekday[index].number]
                }

                return String(format: internationalControl.localizedString("RecurrenceRuleText.ByWeekdaysOrMonthdaysOrMonths"), unitString, weekdaysString)
            }

        case .monthly:
			let bymonthday = self.bymonthday.sorted(by: <)
            guard bymonthday.count > 0 else {
                return nil
            }

            if bymonthday.count == 1 && calendar.dateComponents([.day], from: occurrenceDate).day == bymonthday.first! {
                return String(format: internationalControl.localizedString("RecurrenceRuleText.BasicRecurrence"), unitString)
            } else {
                var monthdaysString: String

				monthdaysString = internationalControl.localizedString("RecurrenceRuleText.Element.On.Monthly") + " " + String.sequenceNumberString(bymonthday.first!)

                for index in 1..<bymonthday.count {
                    var prefixStr: String
                    if index == bymonthday.count - 1 {
                        prefixStr = " " + internationalControl.localizedString("RecurrenceRuleText.Element.And")
                    } else {
                        prefixStr = internationalControl.localizedString("RecurrenceRuleText.Element.Comma")
                    }

                    if internationalControl.language == .english {
                        monthdaysString += prefixStr + " " + String.sequenceNumberString(bymonthday[index])
                    } else {
                        monthdaysString += prefixStr + " " + String(format: internationalControl.localizedString("RecurrenceRuleText.Element.Day"), bymonthday[index])
                    }
                }

                return String(format: internationalControl.localizedString("RecurrenceRuleText.ByWeekdaysOrMonthdaysOrMonths"), unitString, monthdaysString)
            }

        case .yearly:
			let bymonth = self.bymonth.sorted(by: <)
            guard bymonth.count > 0 else {
                return nil
            }

            if bymonth.count == 1 && calendar.dateComponents([.month], from: occurrenceDate).month == bymonth.first! {
                return String(format: internationalControl.localizedString("RecurrenceRuleText.BasicRecurrence"), unitString)
            } else {
                var monthsString: String

				monthsString = internationalControl.localizedString("RecurrenceRuleText.Element.On.Yearly") + " " + Constant.monthSymbols()[bymonth.first! - 1]

                for index in 1..<bymonth.count {
                    var prefixStr: String
                    if index == bymonth.count - 1 {
                        prefixStr = " " + internationalControl.localizedString("RecurrenceRuleText.Element.And")
                    } else {
                        prefixStr = internationalControl.localizedString("RecurrenceRuleText.Element.Comma")
                    }

					monthsString.append(prefixStr)
					monthsString.append(" ")


                    if internationalControl.language == .english {
                        monthsString.append(Constant.monthSymbols()[bymonth[index] - 1])
                    } else {
                        monthsString.append(Constant.shortMonthSymbols()[bymonth[index] - 1])
                    }
                }

                return String(format: internationalControl.localizedString("RecurrenceRuleText.ByWeekdaysOrMonthdaysOrMonths"), unitString, monthsString)
            }

        default:
            return nil
        }
    }
}
