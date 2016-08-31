//
//  RecurrenceRuleUIDelegate.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import Foundation
import RecurrenceRule_iOS

public protocol RecurrencePickerDelegate: class {
    func recurrencePicker(picker: RecurrencePicker, didPickRecurrence recurrenceRule: RecurrenceRule?)
}

public extension RecurrencePickerDelegate {
    func recurrencePicker(picker: RecurrencePicker, didPickRecurrence recurrenceRule: RecurrenceRule?) {

    }
}
