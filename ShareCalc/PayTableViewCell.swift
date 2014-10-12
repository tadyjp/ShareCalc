//
//  PayCell.swift
//  ShareCalc
//
//  Created by tady on 9/27/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class PayTableViewCell: UITableViewCell {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var valueField: UILabel!
    @IBAction func touchValueUp(sender: AnyObject) {
    }
    @IBAction func touchValueDown(sender: AnyObject) {
    }
    
    @IBAction func touchSmallChangeSwitch(sender: AnyObject) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
