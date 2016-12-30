//
//  Problems.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/8/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import Foundation

class Problems {
    fileprivate var _title: String!
    fileprivate var _image: String!
    fileprivate var _solution: String!
    
    var title: String {
        return _title
    }
    
    var image: String {
        return _image
    }
    
    var solution: String {
        return _solution
    }
    
    init(title: String, image: String, solution: String) {
        self._title = title
        self._image = image
        self._solution = solution
    }
}
