//
//  ScavengerHuntItem.swift
//  Scavenger Hunt
//
//  Created by Vanesa Ortiz on 12/19/15.
//  Copyright © 2015 Free Spirit Apps. All rights reserved.
//

import UIKit

class ScavengerHuntItem : NSObject {
    let name: String
    
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
}