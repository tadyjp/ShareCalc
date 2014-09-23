//
//  expense.swift
//  ShareCalc
//
//  Created by tady on 9/23/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import Foundation

class Expense {
    let date: NSDate
    let payer: String
    let type: String
    let value: Int
    
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