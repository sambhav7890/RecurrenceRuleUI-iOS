//
//  InternationalControl.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import Foundation

private let Framework = "RecurrenceRuleUI-iOS"

public enum RecurrencePickerLanguage {
    case english
    internal var identifier: String {
        switch self {
        case .english: return "en"
        }
    }
}

internal func LocalizedString(_ key: String, comment: String? = nil) -> String {
    return InternationalControl.sharedControl.localizedString(key, comment: comment)
}

internal class InternationalControl: NSObject {

    internal static var sharedControl = InternationalControl()
    internal var language: RecurrencePickerLanguage = .english

	convenience init(_ language: RecurrencePickerLanguage = RecurrencePickerLanguage.english) {
		self.init()
		self.language = language
		InternationalControl.sharedControl = self
	}

    internal func localizedString(_ key: String, comment: String? = nil) -> String {

		let path = Bundle.recurrencePickerBundle()?.path(forResource: language.identifier, ofType: "lproj") ?? Bundle.main.path(forResource: language.identifier, ofType: "lproj")

		guard let localizationPath = path else { return key }

		guard let bundle = Bundle(path: localizationPath) else { return key }

		return NSLocalizedString(key, tableName: nil, bundle: bundle, value: key, comment: key)
    }
}


extension Bundle {
	static func recurrencePickerBundle() -> Bundle? {
		let podBundle = Bundle(for: InternationalControl.self)
		guard let bundleURL = podBundle.url(forResource: Framework, withExtension: "bundle") else { return nil }
		guard let bundle = Bundle(url: bundleURL) else { return nil }
		return bundle
	}
}
