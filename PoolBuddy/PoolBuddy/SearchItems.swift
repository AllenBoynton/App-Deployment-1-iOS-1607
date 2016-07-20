//
//  SearchItems.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/7/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

// MARK: Properties

class SearchItems {
    
    // Keeping images private so no one can change them
    private var _imageName: String!
    private var _group: String!
    
    var imageName: String {
        
        return _imageName
    }
    
    var group: String {
        
        return _group
    }
    
    init(imageName: String, group: String) {
        self._imageName = imageName
        self._group = group
    }
}
