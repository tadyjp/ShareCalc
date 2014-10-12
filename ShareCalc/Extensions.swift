//
//  Extensions.swift
//  ShareCalc
//
//  Created by tady on 10/12/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

extension UIView {
//    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle = NSBundle.mainBundle()) -> UIView! {
//        return UINib(nibName: nibNamed, bundle: bundle).instantiateWithOwner(nil, options: nil)[0] as? UIView
//    }

    class func loadFromNib(nibName: String) -> UIView! {
        return NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)[0] as UIView
    }
}
