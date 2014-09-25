//
//  expense.swift
//  ShareCalc
//
//  Created by tady on 9/23/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import Foundation

class Expense: Printable {
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
    
    var description: String {
        return "Expense<date: '\(self.dateWithFormat)', payer: '\(self.payer)', type: '\(self.type)', value: \(self.value)>"
    }
    
    var dateWithFormat: String {
        return Helpers.formatDate(self.date)
    }
}