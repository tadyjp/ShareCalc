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
    
    init(name: String, value: Int) {
        self.name = name
        self.value = value
    }
    
    var description: String {
        return "Expense<name: '\(self.name)', value: \(self.value)>"
    }
    
    class func generateList(#fromPayerList: [Payer]) -> [Payer] {
        return []
    }

    class func generateList(#fromExpenseList: [Expense]) -> [Payer] {
        var payers: [Payer] = []
        for payerName in $.uniq(fromExpenseList.map({ (expense) in expense.payer })) {
            payers.append(Payer(name: payerName, value: 0))
        }
        return payers
    }
}