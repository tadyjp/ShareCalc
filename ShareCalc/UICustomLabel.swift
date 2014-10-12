//
//  UICustomLabel.swift
//  ShareCalc
//
//  Created by tady on 10/5/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class UICustomLabel: UIView {
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var valueField: UILabel!
    
    class func render(label: String, value: String) -> UIView {
        let customLabel = UIView.loadFromNib("UICustomLabel") as UICustomLabel
        customLabel.labelField.text = "total"
        customLabel.valueField.text = "12,000"
        return customLabel
    }
}
