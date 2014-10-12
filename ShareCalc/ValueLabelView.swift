//
//  ValueLabelView.swift
//  ShareCalc
//
//  Created by tady on 10/5/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class ValueLabelView: UIView {
    
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var valueField: UILabel!
    
    class func render(label: String, value: String) -> UIView {
        let customLabel = UIView.loadFromNib("ValueLabelView") as ValueLabelView
        customLabel.labelField.text = label
        customLabel.valueField.text = value
        return customLabel
    }
}
