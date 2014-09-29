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

    override func viewDidLoad() {
        super.viewDidLoad()

        let app: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        app.payerList = Payer.generateList(app.payerList, expenseList: app.expenseList)
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
        
        let cell: PayCellViewController = self.payerListTable.dequeueReusableCellWithIdentifier("payCell") as PayCellViewController
        cell.nameField.text = app.payerList[indexPath.row].name
        cell.valueField.text = String(app.payerList[indexPath.row].value)
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
