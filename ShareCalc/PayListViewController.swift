//
//  PayViewController.swift
//  ShareCalc
//
//  Created by tady on 9/27/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class PayListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var payerListTable: UITableView!
    @IBOutlet weak var totalValueLabelViewWrapper: UIView!

    var totalValueLabelView: ValueLabelView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalValueLabelView = ValueLabelView.render("total", value: "0")
        self.totalValueLabelViewWrapper.addSubview(self.totalValueLabelView)

        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        app.payerList = Payer.generateList(app.payerList, expenseList: app.expenseList)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)

        self.totalValueLabelView.valueField.text =
            Helpers.formatValue(app.payerList.reduce(0, combine: {$0 + $1.value}))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        return app.payerList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        let cell: PayTableViewCell = self.payerListTable.dequeueReusableCellWithIdentifier("payCell") as PayTableViewCell
        cell.nameField.text = app.payerList[indexPath.row].name
        cell.valueField.text = Helpers.formatValue(app.payerList[indexPath.row].value)
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
