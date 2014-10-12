//
//  Payer.swift
//  ShareCalc
//
//  Created by tady on 9/27/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import Foundation

class Payer: Printable, Equatable {
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
            let payerInList = $.find(newPayerList, iterator: {
                (payer: Payer) in
                return payer.name == expense.payer
            })

            if let payer = payerInList {
                payer.value += expense.value
            } else {
                newPayerList.append(Payer(name: expense.payer, value: expense.value))
            }
        }
        return newPayerList
    }
}

func == (lhs: Payer, rhs: Payer) -> Bool {
    return lhs.name == rhs.name
}

// TODO: merge payer and expense