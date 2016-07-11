//
//  DataSource.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/5/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

// Populates data within arrays assigned in plist
class DataSource {
    
    init() {
        populateData()
    }
    
    // Delegate for DogGroup and creates property for both pools & groups
    var pools: [SearchItems] = []
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
        if let path = NSBundle.mainBundle().pathForResource("PoolGallery", ofType: "plist") {
            if let plistArray = NSArray(contentsOfFile: path) {
                for item in plistArray {
                    if let dictionary = item as? NSDictionary {
                        let imageName = dictionary["imageName"] as! String
                        let group = dictionary["group"] as! String
                        
                        // Assigns plist data with custom data source in PoolGallery
                        let pool = SearchItems(imageName: imageName, group: group)
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
    
    func poolsInGroup(index: Int) -> [SearchItems] {
        let item = groups[index]
        let filteredPools = pools.filter { (pool: SearchItems) -> Bool in
            return pool.group == item
        }
        return filteredPools
    }
}
