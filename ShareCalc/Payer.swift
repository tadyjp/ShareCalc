//
//  Payer.swift
//  ShareCalc
//
//  Created by tady on 9/27/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import Foundation

class Payer: Printable {
    var name: String
    var value: Int
    var hasSmallChange: Bool
    
    init(name: String, value: Int) {
        self.name = name
        self.value = value
        self.hasSmallChange = false
    }
    
    var description: String {
        return "Expense<name: '\(self.name)', value: \(self.value)>"
    }
    
    class func generateList(payerList: [Payer], expenseList: [Expense]) -> [Payer] {
        var newPayerList: [Payer] = payerList
        for expense in expenseList {
            if !$.contains(newPayerList.map({$0.name}), value: expense.payer) {
                newPayerList.append(Payer(name: expense.payer, value: 0))
            }
        }
        return newPayerList
    }
}