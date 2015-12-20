//
//  ScavengerHuntItem.swift
//  Scavenger Hunt
//
//  Created by Vanesa Ortiz on 12/19/15.
//  Copyright © 2015 Free Spirit Apps. All rights reserved.
//

import UIKit

class ScavengerHuntItem : NSObject, NSCoding {
    let name: String
    
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    let nameKey = "name"
    let photoKey = "photo"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey:  nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: photoKey)
        }
    }
    
    required init?(coder aDecoder: NSCoder) { // if you subclass your item its imperative that you set init as required
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        photo = aDecoder.decodeObjectForKey(photoKey) as? UIImage
    }
    
    init(name: String) { // create the item
        self.name = name
    }
}

