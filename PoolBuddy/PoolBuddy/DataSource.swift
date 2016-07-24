//
//  DataSource.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/22/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

// Populates data within arrays assigned in plist
class DataSource {
    
    init() {
        populateData()
    }
    
    // Delegate for ImageData and creates property for both images & groups
    var pools: [ImageData] = []
    var groups: [String] = []
    
    // Determines how many cells in a sections
    func numberOfRowsInEachGroup(index: Int) -> Int {
        return poolsInGroup(index).count
    }
    
    // Determines how many sections
    func numberOfGroups() -> Int {
        return groups.count
    }
    
    // Fetch the group name
    func getGroupLabelAtIndex(index: Int) -> String {
        return groups[index]
    }
    
    // MARK: Populate Data from plist file
    
    func populateData() {
        
        // Accesses plist and pulls data then categorizes them
        if let path = NSBundle.mainBundle().pathForResource("Pools", ofType: "plist") {
            if let plistArray = NSArray(contentsOfFile: path) {
                for item in plistArray {
                    if let dictionary = item as? NSDictionary {
                        let image = dictionary["image"] as! String
                        let group = dictionary["group"] as! String
                        
                        // Assigns plist data with custom data source in ImageData
                        let pool = ImageData(image: image, group: group)
                        if !groups.contains(group) {
                            groups.append(group)
                        }
                        pools.append(pool) // Adds each one
                    }
                }
            }
        }
    }
    
    // MARK: Assigns dogs in their groups
    
    func poolsInGroup(index: Int) -> [ImageData] {
        let item = groups[index]
        let filteredPools = pools.filter { (pool: ImageData) -> Bool in
            return pool.group == item
        }
        return filteredPools
    }
}