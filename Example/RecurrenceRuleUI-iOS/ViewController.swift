//
//  ViewController.swift
//  RecurrenceRuleUI-iOS
//
//  Created by Sambhav Shah on 08/31/2016.
//  Copyright (c) 2016 Sambhav Shah. All rights reserved.
//

import UIKit
import RecurrenceRule-UI

private let kBlueColor = UIColor(red: 3.0 / 255.0, green: 169.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)

class ViewController: UIViewController {
	var recurrenceRule: RecurrenceRule?
	var language: RecurrencePickerLanguage = .English
	var occurrenceDate: Date { return datePicker.date }

	@IBOutlet weak var resultTextView: UITextView!
	@IBOutlet weak var datePicker: UIDatePicker!

	override func viewDidLoad() {
		super.viewDidLoad()

		updateResultTextView()
	}

	// MARK: - Helper
	fileprivate func updateResultTextView() {
		if let recurrenceRule = recurrenceRule {
			resultTextView.text = recurrenceRule.toRRuleString() + "\r\r" + (recurrenceRule.toText(language: language, occurrenceDate: occurrenceDate) ?? "")
		} else {
			resultTextView.text = nil
		}
	}

	// MARK: - Actions
	@IBAction func pickButtonTapped(_ sender: UIButton) {
		let recurrencePicker = RecurrencePicker(recurrenceRule: recurrenceRule)
		recurrencePicker.tintColor = kBlueColor
		recurrencePicker.language = language
		recurrencePicker.occurrenceDate = occurrenceDate
		recurrencePicker.backgroundColor = UIColor(white: 242 / 255, alpha: 1)
		recurrencePicker.separatorColor = UIColor(white: 221 / 255, alpha: 1)
		recurrencePicker.delegate = self
		navigationController?.pushViewController(recurrencePicker, animated: true)
	}

	@IBAction func datePickerPicked(_ sender: UIDatePicker) {
		print("Occurrence Date: \(sender.date)")
		updateResultTextView()
	}
}

extension ViewController: RecurrencePickerDelegate {
	func recurrencePicker(_ picker: RecurrencePicker, didPickRecurrence recurrenceRule: RecurrenceRule?) {
		self.recurrenceRule = recurrenceRule
		updateResultTextView()
	}
}
