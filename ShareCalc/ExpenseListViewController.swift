//
//  ExpenseListViewController.swift
//  ShareCalc
//
//  Created by tady on 9/23/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class ExpenseListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var expenseTableView: UITableView!
    @IBOutlet weak var totalValueLabelViewWrapper: UIView!
    @IBOutlet weak var totalItemsLabelViewWrapper: UIView!
    @IBOutlet weak var totalPayersLabelViewWrapper: UIView!
    
    var totalValueLabelView: ValueLabelView!
    var totalItemsLabelView: ValueLabelView!
    var totalPayersLabelView: ValueLabelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalValueLabelView = ValueLabelView.render("total", value: "0")
        self.totalValueLabelViewWrapper.addSubview(self.totalValueLabelView)
        self.totalItemsLabelView = ValueLabelView.render("items", value: "0")
        self.totalItemsLabelViewWrapper.addSubview(self.totalItemsLabelView)
        self.totalPayersLabelView = ValueLabelView.render("payers", value: "0")
        self.totalPayersLabelViewWrapper.addSubview(self.totalPayersLabelView)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.expenseTableView.reloadData()
        
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        self.totalValueLabelView.valueField.text = Helpers.formatValue(app.expenseList.reduce(0, combine: {$0 + $1.value}))
        self.totalItemsLabelView.valueField.text = String(app.expenseList.count)
        self.totalPayersLabelView.valueField.text = String($.uniq(app.expenseList.map({ (item) in item.payer })).count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        return app.expenseList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)

        let cell: ExpenseTableViewCell = self.expenseTableView.dequeueReusableCellWithIdentifier("ExpenseTableViewCell") as ExpenseTableViewCell
        cell.dateField.text = app.expenseList[indexPath.row].dateWithFormat
        cell.valueField.text = app.expenseList[indexPath.row].valueWithFormat
        cell.typeField.text = app.expenseList[indexPath.row].type
        cell.payerField.text = app.expenseList[indexPath.row].payer
        return cell;
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let expenseEditViewController: ExpenseDetailViewController = segue.destinationViewController as ExpenseDetailViewController

        switch segue.identifier {
        case "toExpenseEdit":
            let indexPath: NSIndexPath = self.expenseTableView.indexPathForSelectedRow()!
            expenseEditViewController.expenseIndexPathRow = indexPath.row
            expenseEditViewController.actionType = "edit"
        case "toExpenseAdd":
            expenseEditViewController.actionType = "add"
        default:
            break
        }
    }

}
