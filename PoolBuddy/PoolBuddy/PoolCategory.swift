//
//  PoolCategory.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/14/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import Foundation

class PoolCategory {
    
    // Stored properties
    var category: String
    var products: [PoolData]
    
    init(menu: String, group: [PoolData]) {
        
        category = menu
        products = group
    }
    
    // Class arrays of same category for sections
    
    // Create categories of each item in Equipment menu
    class func poolEquipment() -> [PoolCategory] {
        
        return [self.poolFilters(), self.poolPumps(), self.poolEquipment()]
    }
    
    // Create categories of each item in Chemical menu
    class func poolChemicals() -> [PoolCategory] {
        
        return [self.chlorineTypes(), self.poolChemicals()]
    }
    
    // Create categories of each item in Chemical menu
    class func waterChemistry() -> [PoolCategory] {
        
        return [self.waterChemistry()]
    }
    
    // Create categories of each item in Chemical menu
    class func maintenanceEquipment() -> [PoolCategory] {
        
        return [self.maintenanceEquipment()]
    }
    
    // Create categories of each item in Chemical menu
    class func poolMaintenance() -> [PoolCategory] {
        
        return [self.poolMaintenance()]
    }

    
    // Methods for each sub-category of the menu categories
    
    // All rows within the Filter category
    private class func poolFilters() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "DE Filter", image: "DEFilter", description: "DE filter info"))
        products.append(PoolData(label: "Sand Filter", image: "sandFilter", description: "Sand filter info"))
        products.append(PoolData(label: "Cartridge Filter", image: "cartridgeFilter", description: "Cartridge filter info"))
        
        return PoolCategory(menu: "Pool Filters", group: products)
    }
    
    // All rows within the Pump category
    private class func poolPumps() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Inground Pumps", image: "Super-Pump", description: "IG pumps"))
        products.append(PoolData(label: "Above-Ground Pumps", image: "PowerFloAG", description: "AG pumps"))
        
        return PoolCategory(menu: "Pool Pumps", group: products)
    }
    
    // All rows within the Equipment category
    private class func poolEquipment() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Pool Heaters", image: "heater", description: "Safety stuff"))
        products.append(PoolData(label: "Pool Skimmer", image: "skimmer", description: "Filter valves"))
        products.append(PoolData(label: "Timers", image: "timer", description: "Safety stuff"))
        products.append(PoolData(label: "Automatic Pool Cleaners", image: "autocleaner", description: "Filter valves"))
        products.append(PoolData(label: "Water Valves", image: "mpValve", description: "Filter valves"))
        products.append(PoolData(label: "Chemical Feeders", image: "chlorinator", description: "Safety stuff"))
        products.append(PoolData(label: "Safety Items", image: "rules", description: "Safety stuff"))
        products.append(PoolData(label: "Recreational", image: "slide", description: "Filter valves"))
        
        return PoolCategory(menu: "Pool Equipment", group: products)
    }
    
    // All rows within the Maintenance Equipment category
    private class func maintenanceEquipment() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Telepole", image: "telepole", description: "Safety stuff"))
        products.append(PoolData(label: "Pool Brush", image: "brush", description: "Safety stuff"))
        products.append(PoolData(label: "Concrete Vacuum Head", image: "concreteVacuum", description: "Filter valves"))
        products.append(PoolData(label: "Vinyl Vacuum Head", image: "vinylVacuum", description: "Safety stuff"))
        products.append(PoolData(label: "Vacuum Hose", image: "vacuumHose", description: "Filter valves"))
        products.append(PoolData(label: "Leaf Rake", image: "leafRake", description: "Filter valves"))
        products.append(PoolData(label: "Leaf Skimmer", image: "leafSkimmer", description: "Safety stuff"))
        products.append(PoolData(label: "Pool Skimmer", image: "skimmer", description: "Filter valves"))
        products.append(PoolData(label: "Skimmer Parts", image: "skimmerBasket", description: "Safety stuff"))
        
        
        return PoolCategory(menu: "Maintenance Equipment", group: products)
    }
    
    // All rows within the Chlorine category
    private class func chlorineTypes() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Chlorine Tablets", image: "singletablets", description: "IG pumps"))
        products.append(PoolData(label: "Granular Chlorine", image: "calhypo-1", description: "AG pumps"))
        products.append(PoolData(label: "Chlorine Generator", image: "chlorineGenerator", description: "AG pumps"))
        
        return PoolCategory(menu: "Chlorine", group: products)
    }
    
    // All rows within the Chemicals category
    private class func poolChemicals() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Oxidizer", image: "oxidizer", description: "IG pumps"))
        products.append(PoolData(label: "pH Increase", image: "phIncrease", description: "AG pumps"))
        products.append(PoolData(label: "pH Decrease", image: "dryAcid", description: "Safety stuff"))
        products.append(PoolData(label: "Alkalinity Increase", image: "alkalinityUp", description: "valves"))
        products.append(PoolData(label: "Hardness Increase", image: "hardnessPlus", description: "Safety stuff"))
        products.append(PoolData(label: "Cyanuric Acid", image: "conditioner", description: " valves"))
        products.append(PoolData(label: "Sequestering Agents", image: "sequestering", description: "Safety stuff"))
        products.append(PoolData(label: "Algaecides", image: "algaecide", description: "Filter valves"))
        products.append(PoolData(label: "Water Clarifier", image: "clarifier", description: "Safety stuff"))
        products.append(PoolData(label: "Enzymes", image: "perfect", description: "Filter valves"))
        products.append(PoolData(label: "Metal Removers", image: "metalFree", description: "IG pumps"))
        products.append(PoolData(label: "Stain Removers", image: "stain-remover", description: "AG pumps"))
        products.append(PoolData(label: "Cleaners", image: "sandRevitalizer", description: "AG pumps"))
        
        return PoolCategory(menu: "Pool Chemicals", group: products)
    }
    
    // All rows within the Water Chemistry category
    private class func waterChemistry() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Free Chlorine", image: "levels", description: "IG pumps"))
        products.append(PoolData(label: "Combined Chlorine", image: "dpdTest", description: "AG pumps"))
        products.append(PoolData(label: "pH (Power of Hydrogen)", image: "ph", description: "IG pumps"))
        products.append(PoolData(label: "Alkalinity", image: "testKit", description: "AG pumps"))
        products.append(PoolData(label: "Calcium Hardness", image: "waterTest1", description: "Safety stuff"))
        products.append(PoolData(label: "Cyanuric Acid", image: "testStrips", description: "valves"))
        products.append(PoolData(label: "TDS (Total Dissolved Solids)", image: "chemicals1", description: "Safety stuff"))
        products.append(PoolData(label: "Phosphates", image: "phosphates", description: "valves"))
        
        return PoolCategory(menu: "Water Chemistry", group: products)
    }
    
    // All rows within the Maintenance category
    private class func poolMaintenance() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Inground Pumps", image: "Super-Pump", description: "IG pumps"))
        products.append(PoolData(label: "Above-Ground Pumps", image: "PowerFloAG", description: "AG pumps"))
        
        return PoolCategory(menu: "Pool Maintenance", group: products)
    }
}