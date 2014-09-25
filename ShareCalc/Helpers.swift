//
//  Helpers.swift
//  ShareCalc
//
//  Created by tady on 9/24/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import Foundation

class Helpers {
    class func formatDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        return dateFormatter.stringFromDate(date)
    }

    class func parseDate(date: String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        return dateFormatter.dateFromString(date)!
    }
}