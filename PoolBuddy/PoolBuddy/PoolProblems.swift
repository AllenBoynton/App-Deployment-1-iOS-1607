//
//  PoolProblems.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/28/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import Foundation

class PoolProblems {
    
    // Stored properties
    var gallery: String!
    var solutions: [Problems]
    
    init(gallery: String, problem: [Problems]) {
        self.gallery = gallery
        self.solutions = problem
    }
    
    // Class arrays of same category for sections
    
    // Create categories of each item in Equipment menu
    class func poolGallery() -> [PoolProblems] {
        return [self.poolFilters()]
    }
    
    // All rows within the Gallery category
    private class func poolGallery() -> PoolCategory {
        
        var solutions = [Problems]()
        
        solutions.append(Problems(title: "Green Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Yellow Mustard Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Green Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Yellow Mustard Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Green Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Yellow Mustard Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Green Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Yellow Mustard Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Green Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Yellow Mustard Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Green Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Yellow Mustard Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Green Algae", image: "", solution: ""))
        
        solutions.append(Problems(title: "Yellow Mustard Algae", image: "", solution: ""))
        
        
        return PoolProblems(gallery: "Problems Gallery", problem: solutions)
    }

    
}