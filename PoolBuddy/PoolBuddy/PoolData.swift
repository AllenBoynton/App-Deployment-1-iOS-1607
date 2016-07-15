//
//  PoolData.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/3/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import Foundation

class PoolData {
    
    var label: String = ""
    var image: String = ""
    var description: String = ""
    
    init(label: String, image: String, description: String) {
        
        self.label = label
        self.image = image
        self.description = description
    }
}
