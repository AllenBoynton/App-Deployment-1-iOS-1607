//
//  DataSource.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/22/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import Foundation

class DataSource {
    
    init() {
        populateData()
    }
    
    // Delegate for ImageData and creates property for both images & groups
    var pools:[ImageData] = []
    var groups:[String] = []
    
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
        print(groups[index])
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
        print(item)
        let filteredSearch = pools.filter { (pool: ImageData) -> Bool in
            return pool.group == item
        }
        return filteredSearch
    }

    
//    // Keeping images private so no one can change them
//    private var _group: String!
//    private var _image: [SearchImages]
//    
//    var group: String {
//        
//        return _group
//    }
//    
//    var image: [SearchImages] {
//        
//        return _image
//    }
//    
//    init(group: String, photo: [SearchImages]) {
//        self._group = group
//        self._image = photo
//    }
//    
//    
//    
//    // Create categories of each image in Gallery
//    class func poolGallery() -> [PoolGroups] {
//        
//        return [self.poolGallery1(), self.poolGallery2(), self.poolGallery3(), self.poolGallery4()]
//    }
//    
//    
//    
//    // All rows within the Gallery groups
//    private class func poolGallery1() -> PoolGroups {
//        
//        var images = [SearchImages]()
//        
//        images.append(SearchImages(image: "Green Algae"))
//        images.append(SearchImages(image: "Mustard Yellow Algae"))
//        images.append(SearchImages(image: "Black Algae"))
//        
//        return PoolGroups(group: "Pools with Algae Problems", photo: images)
//    }
//    
//    private class func poolGallery2() -> PoolGroups {
//        
//        var images = [SearchImages]()
//        
//        images.append(SearchImages(image: "Metal Rust Stains"))
//        images.append(SearchImages(image: "Copper Metal Stains"))
//        images.append(SearchImages(image: "Iron Metal Stains"))
//        images.append(SearchImages(image: "Manganese Metal Stains"))
//        
//        return PoolGroups(group: "Pools with Metal Problems", photo: images)
//    }
//    
//    private class func poolGallery3() -> PoolGroups {
//        
//        var images = [SearchImages]()
//        
//        images.append(SearchImages(image: "Oily Water Line"))
//        images.append(SearchImages(image: "Organic Stains"))
//        images.append(SearchImages(image: "Organic Berry Stains"))
//        
//        return PoolGroups(group: "Pools with Organic Stains", photo: images)
//    }
//    
//    private class func poolGallery4() -> PoolGroups {
//        
//        var images = [SearchImages]()
//        
//        images.append(SearchImages(image: "Surface Debris"))
//        images.append(SearchImages(image: "Extremely Dirty"))
//        images.append(SearchImages(image: "Identifying Stains"))
//        
//        return PoolGroups(group: "Pools with Dirty Water", photo: images)
//    }
    

}