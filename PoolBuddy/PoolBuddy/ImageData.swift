//
//  ImageData.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/7/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import Foundation

class ImageData {
    
    private var _image: String!
    private var _group: String!
    
    var image: String {
        
        return _image
    }
    
    var group: String {
        
        return _group
    }
    
    init(image: String, group: String) {
        
        self._image = image
        self._group = group
    }
}