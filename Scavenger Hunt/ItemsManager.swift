//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by Vanesa Ortiz on 12/19/15.
//  Copyright © 2015 Free Spirit Apps. All rights reserved.
//

import UIKit

class ItemsManager {
    var itemsList = [ScavengerHuntItem]()
    
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        // will return an array of directories where it can store files
        if let documentsPath = directoryList.first {
            return documentsPath + "/ScavengerHuntItems"
        }
        assertionFailure("Could not determine where to save file.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(itemsList, toFile: theArchivePath) {
                print("Saved sucessfully")
            } else {
                assertionFailure("Could not save.")
            }
        }
    }
    
    func unarchive() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
    }
    
    init() {
        unarchive()
    }
}
