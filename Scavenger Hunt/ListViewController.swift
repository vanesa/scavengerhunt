//
//  ListViewController.swift
//  Scavenger Hunt
//
//  Created by Vanesa Ortiz on 12/19/15.
//  Copyright © 2015 Free Spirit Apps. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController {
    var itemsList = [ScavengerHuntItem(name: "Vista Point"),
        ScavengerHuntItem(name: "Sausalito Boardwalk"),
        ScavengerHuntItem(name: "Rodeo Beach")
    ] // items in the list
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addItemController = segue.sourceViewController as! AddViewController // give source view controller
            if let newItem = addItemController.newItem {
                itemsList += [newItem] // turning it into an array to add it to the array
                let indexPath = NSIndexPath(forRow: itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        let item = itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}
