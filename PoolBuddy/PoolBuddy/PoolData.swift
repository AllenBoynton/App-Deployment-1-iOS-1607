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
    fileprivate var _label: String!
    fileprivate var _image: String!
    fileprivate var _label2: String!
    fileprivate var _image2: String!
    fileprivate var _description: String!
    
    var label: String {
        if _label == nil {
            _label = ""
        }
        return _label
    }
    
    var image: String {
        if _image == nil {
            _image = ""
        }
        return _image
    }
    
    var label2: String {
        if _label2 == nil {
            _label2 = ""
        }
        return _label
    }
    
    var image2: String {
        if _image2 == nil {
            _image2 = ""
        }
        return _image2
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    init(label: String, image: String, label2: String, image2: String, description: String) {
        self._label = label
        self._image = image
        self._label2 = label2
        self._image2 = image2
        self._description = description
    }
}
