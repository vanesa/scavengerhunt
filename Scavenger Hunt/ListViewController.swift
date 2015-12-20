//
//  ListViewController.swift
//  Scavenger Hunt
//
//  Created by Vanesa Ortiz on 12/19/15.
//  Copyright © 2015 Free Spirit Apps. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController {

    let myManager = ItemsManager()
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addItemController = segue.sourceViewController as! AddViewController // give source view controller
            if let newItem = addItemController.newItem {
                myManager.itemsList += [newItem] // turning it into an array to add it to the array
                myManager.save()
                let indexPath = NSIndexPath(forRow: myManager.itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        let item = myManager.itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}
