//
//  ExpenseEditTableViewController.swift
//  ShareCalc
//
//  Created by tady on 9/23/14.
//  Copyright (c) 2014 tady. All rights reserved.
//

import UIKit

class ExpenseEditTableViewController: UITableViewController, UITextFieldDelegate {

    var expenseIndexPathRow: Int?
    var actionType: String?
    var editingExpense: Expense?

    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var payerField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        if self.actionType! == "add" {
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneEdit"))
            self.navigationItem.rightBarButtonItem = doneButton
        }
        
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
//        datePicker.addTarget(self, action: Selector("updateDateField:"), forControlEvents: UIControlEvents.ValueChanged)
        self.dateField.inputView = datePicker
        self.dateField.delegate = self

//        self.valueField.addTarget(self, action: Selector("updateValueField:"), forControlEvents: UIControlEvents.EditingChanged)
        
        switch self.actionType! {
        case "edit":
            let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            self.editingExpense = app.expenseList![self.expenseIndexPathRow!]
        case "add":
            self.editingExpense = Expense(date: NSDate(), payer: "Enter type...", type: "Enter payer...", value: 0)
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.dateField.text = self.editingExpense!.dateWithFormat
        self.typeField.text = self.editingExpense!.type
        self.payerField.text = self.editingExpense!.payer
        self.valueField.text = String(self.editingExpense!.value)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.updateEditingExpense()
        
        if !$.contains(self.navigationController!.viewControllers as [UIViewController], value: self) {
            let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)

            if self.actionType! == "edit" {
                app.expenseList![self.expenseIndexPathRow!] = self.editingExpense!
            }
        }
        
        super.viewWillDisappear(animated)
    }

    func updateEditingExpense() {
        self.editingExpense!.date = Helpers.parseDate(self.dateField.text)
        self.editingExpense!.type = self.typeField.text
        self.editingExpense!.payer = self.payerField.text
        if let value = self.valueField.text.toInt() {
            self.editingExpense!.value = value
        } else {
            self.editingExpense!.value = 0
        }
    }
    
    func doneEdit() {
        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        app.expenseList!.append(self.editingExpense!)        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
//    func updateDateField(picker: UIDatePicker) {
//        if self.actionType! == "edit" {
//            let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
//            app.expenseList![self.expenseIndexPathRow!].date = picker.date
//            self.dateField.text = Helpers.formatDate(picker.date)
//        }
//    }
//
//    func updateValueField(sender: AnyObject) {
//        if self.actionType! == "edit" {
//            let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
//            if let value = self.valueField.text.toInt() {
//                app.expenseList![self.expenseIndexPathRow!].value = value
//            } else {
//                app.expenseList![self.expenseIndexPathRow!].value = 0
//            }
//        }
//    }

    
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
        self.updateEditingExpense()
        
        let expenseEditSelectionTableViewController: ExpenseEditSelectionTableViewController = segue.destinationViewController as ExpenseEditSelectionTableViewController
        expenseEditSelectionTableViewController.editingExpense = self.editingExpense!

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
