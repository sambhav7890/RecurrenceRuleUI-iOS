//
//  InternationalControl.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import Foundation

public enum RecurrencePickerLanguage {
    case English

    internal var identifier: String {
        switch self {
        case .English: return "en"
        }
    }
}

internal func LocalizedString(key key: String, comment: String? = nil) -> String {
    return InternationalControl.sharedControl.localizedString(key: key, comment: comment)
}

internal class InternationalControl: NSObject {

    internal static var sharedControl = InternationalControl()
    internal var language: RecurrencePickerLanguage = .English

	convenience init(language: RecurrencePickerLanguage) {
		self.init()
		self.language = language
		InternationalControl.sharedControl = self
	}

    internal func localizedString(key key: String, comment: String? = nil) -> String {
        let path = NSBundle.recurrencePickerBundle()?.pathForResource(language.identifier, ofType: "lproj") ?? NSBundle.mainBundle().pathForResource(language.identifier, ofType: "lproj")
        guard let localizationPath = path else {
            return key
        }
        let bundle = NSBundle(path: localizationPath)
        return bundle?.localizedStringForKey(key, value: nil, table: "RecurrencePicker") ?? key
    }
}


extension NSBundle {
	static func recurrencePickerBundle() -> NSBundle? {
		let podBundle = NSBundle(forClass: InternationalControl.self)
		guard let bundleURL = podBundle.URLForResource("RecurrencePicker", withExtension: "bundle") else { return nil }
		guard let bundle = NSBundle(URL: bundleURL) else { return nil }
		return bundle
	}
}