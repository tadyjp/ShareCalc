//
//  ExpenseEditTableViewController.swift
//  ShareCalc
//
//  Created by tady on 9/23/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class ExpenseEditTableViewController: UITableViewController {

    var expenseIndexPathRow: Int?

    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var payerField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "doneEdit")
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        self.dateField.text = app.expenseList![self.expenseIndexPathRow!].dateWithFormat
        self.typeField.text = app.expenseList![self.expenseIndexPathRow!].type
        self.payerField.text = app.expenseList![self.expenseIndexPathRow!].payer
        self.valueField.text = String(app.expenseList![self.expenseIndexPathRow!].value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doneEdit() {
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
//        app.expenseList![self.indexPathRow!].payer = self.payerField.text
//        app.expenseList![self.indexPathRow!].type = self.typeField.text
//        if let value = self.valueField.text.toInt() {
//            app.expenseList![self.indexPathRow!].value = value
//        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    // MARK: - Table view data source

    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
    */

    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let expenseEditSelectionTableViewController: ExpenseEditSelectionTableViewController = segue.destinationViewController as ExpenseEditSelectionTableViewController
        expenseEditSelectionTableViewController.expenseIndexPathRow = self.expenseIndexPathRow

        switch segue.identifier {
        case "toExpenseTypeEdit":
            expenseEditSelectionTableViewController.choiceType = "type"
        case "toExpensePayerEdit":
            expenseEditSelectionTableViewController.choiceType = "payer"
        default:
            break
        }
    }

}
