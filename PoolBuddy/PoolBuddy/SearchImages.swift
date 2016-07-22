//
//  SearchImages.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/7/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

// MARK: Properties

// This is in reference for the gallery images

class SearchImages {
    
    // Keeping images private so no one can change them
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
