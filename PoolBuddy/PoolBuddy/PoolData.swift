//
//  PoolData.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/3/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import Foundation

// This is in reference to the pool products/items

class PoolData {
    var _label: String!
    var _image: String!
    var _description: String!
    
    var label: String {
        return _label
    }
    
    var image: String {
        return _image
    }
    
    var description: String {
        return _description
    }
    
    init(label: String, image: String, description: String) {
        self._label = label
        self._image = image
        self._description = description
    }
}
