//
//  ExpenseViewController.swift
//  ShareCalc
//
//  Created by tady on 9/23/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var expenseTableView: UITableView!

    var expenseList: [Expense]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        if let expenseList = app.expenseList {
            self.expenseList = app.expenseList
        } else {
            app.expenseList = []
            self.expenseList = app.expenseList
        }
        
        self.expenseList!.append(Expense(date: NSDate(), payer: "Yamada", type: "Highway", value: 22000))
        self.expenseList!.append(Expense(date: NSDate(), payer: "Suzuki", type: "Lunch", value: 12000))
        self.expenseList!.append(Expense(date: NSDate(), payer: "Sato", type: "Railway", value: 19000))
        self.expenseList!.append(Expense(date: NSDate(), payer: "Kato", type: "Gas", value: 6700))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.expenseList!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ExpenseTableViewCell = self.expenseTableView.dequeueReusableCellWithIdentifier("ExpenseCell") as ExpenseTableViewCell
        cell.expenseDate.text = self.expenseList![indexPath.row].dateWithFormat()
        cell.expenseValue.text = String(self.expenseList![indexPath.row].value)
        cell.expenseType.text = self.expenseList![indexPath.row].type
        cell.expensePayer.text = self.expenseList![indexPath.row].payer
        return cell;
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "toExpenseEdit") {
            let expenseEditViewController: ExpenseEditTableViewController = segue.destinationViewController as ExpenseEditTableViewController
            let indexPath: NSIndexPath = self.expenseTableView.indexPathForSelectedRow()!
            expenseEditViewController.indexPathRow = indexPath.row
        }
    }

}
