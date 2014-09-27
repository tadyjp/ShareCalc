//
//  PayCell.swift
//  ShareCalc
//
//  Created by tady on 9/27/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class PayCellViewController: UITableViewCell {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var valueField: UILabel!
    @IBAction func touchValueUp(sender: AnyObject) {
    }
    @IBOutlet weak var touchValueDown: UIButton!
    
    @IBAction func touchChangeSwitch(sender: AnyObject) {
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
