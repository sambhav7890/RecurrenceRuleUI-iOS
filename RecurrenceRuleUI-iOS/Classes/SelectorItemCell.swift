//
//  SelectorItemCell.swift
//  RecurrenceRuleUI
//
//  Created by Sambhav on 16/8/7.
//  Copyright © 2016 Practo. All rights reserved.
//

import UIKit

internal class SelectorItemCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!

    internal fileprivate(set) var isItemSelected = false

    override func awakeFromNib() {
        super.awakeFromNib()
        setItemSelected(false)
    }

    internal func setItemSelected(_ selected: Bool) {
        isItemSelected = selected
        backgroundColor = selected ? tintColor : UIColor.white
        textLabel.textColor = selected ? UIColor.white : UIColor.black
    }
}
