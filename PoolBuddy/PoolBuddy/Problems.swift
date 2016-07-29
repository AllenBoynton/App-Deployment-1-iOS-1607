//
//  Problems.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/8/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import Foundation

class Problems {
    private var _title: String!
    private var _image: String!
    private var _group: String!
    private var _solution: String!
    
    var title: String {
        return _title
    }
    
    var image: String {
        return _image
    }
    
    var group: String {
        return _group
    }
    
    var solution: String {
        return _solution
    }
    
    init(title: String, image: String, group: String, solution: String) {
        self._title = title
        self._image = image
        self._solution = solution
    }
}