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
        ScavengerHuntItem(name: "Rodeo Beach")] // items in the list
    
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
