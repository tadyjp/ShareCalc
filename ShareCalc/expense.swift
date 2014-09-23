//
//  expense.swift
//  ShareCalc
//
//  Created by tady on 9/23/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import Foundation

class Expense {
    var date: NSDate
    var payer: String
    var type: String
    var value: Int
    
    init(date: NSDate, payer: String, type: String, value: Int) {
        self.date = date
        self.payer = payer
        self.type = type
        self.value = value
    }
    
    func dateWithFormat() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        return dateFormatter.stringFromDate(self.date)
    }
}