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
    var menuItem: String!
    var products: [PoolData]
    
    init(menu: String, group: [PoolData]) {
        menuItem = menu
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
        return [self.cleaningEquipment()]
    }
    
    // Create categories of each item in Chemical menu
    class func poolMaintenance() -> [PoolCategory] {
        return [self.poolMaintenance()]
    }

    
    // Methods for each sub-category of the menu categories
    
    // All rows within the Filter category
    private class func poolFilters() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "DE Filter", image: "DEFilter", description: "Many pool professionals consider D.E. filtration to be the finest, because it is capable of removing smaller particles than either sand or cartridge filters. Clear water can pass through these openings, but particles as small as one to three microns are trapped during the first pass through the media. Pro Grid includes a manual air-relief valve and a top-mounted pressure gauge for easy access and readability. The high-impact grid elements are designed for up-flow filtration and top-down backwashing for maximum efficiency. An integral lift handle and low-profile base make removal of the grid assembly fast and simple. Combining these high-technology features and a 'service-ease' design for an unparalleled filtration value, the D.E. Filter is for the quality conscious pool owner."))
        products.append(PoolData(label: "Sand Filter", image: "sandFilter", description: "The sand in a pool sand filter (#20 silica sand; 45 - 55 mm) is specially graded to trap particles in the 20 - 100 micron range. As a sand filter collects dirt, its efficiency increases, trapping more dirt. When your pressure gauge shows a reading 8 - 10 lbs. over the clean, start-up reading, it is time to backwash the captured dirt out of the filter. \nSand filters are known to be the lowest maintenance of the three types of pool filters. You may only need to open up the tank every 5 years or so. DE filters require removing the internal grid assembly at least annually to clean them well, and cartridge filters don't backwash, you remove the cartridge and hose clean every so often, depending on the cartridge filter size. Sand filters are the easiest to operate and maintain.\n\"They say\" that the sand inside a sand filter should be replaced after seven years. Gradual loss of efficiency may be hard to notice. If your sand filter requires frequent backwashing, every week or two, the sand bed may be \"mudballed\", or it may be \"channeled\". It may also \"calcify\" with calcium deposits. Other water balance problems may also contribute to pool filter sand deterioration, but a properly sized sand filter could go over 10 years between sand changes."))
        products.append(PoolData(label: "Cartridge Filter", image: "cartridgeFilter", description: "Filter of choice for most spas, and many smaller above ground pools, the cartridge filter is enjoying a resurgence in popularity. The cartridge filter element, an aquatic version of the pleated air filter in your car, traps dirt and particles of 25 - 100 microns in size. The cartridge is removed from the tank and hosed thoroughly, top to bottom, with a high pressure hose to remove dirt when the pressure gauge rises 8 - 10 lbs. above its clean reading. I know some people that take their cartridges to the local self serve car wash place for cleaning, but too much pressure may damage the cartridge. Each time the cartridge filter element is cleaned, some of its filtering ability is reduced.\nThe cartridge should be replaced every 3 - 5 yrs, depending on the work it was asked to do. If the filter was a bit undersized, and had some algae every year and lots of tree debris, etc. then it may last only 1 - 2 years. Nicely sized cartridge filters can operate for 6 months between cleanings and get more than 5 yrs from the cartridges."))
        
        return PoolCategory(menu: "Pool Filters", group: products)
    }
    
    // All rows within the Pump category
    private class func poolPumps() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Inground Pumps", image: "Super-Pump", description: "This larger pump and motor is what keeps the water flowing through the filter in your In-Ground Pool. The heart of your circulation system, your pool pump, pulls water from one or more suction ports (i.e., skimmer & main drain), and then pushes it through the filter & heater (if you have one) and back to the pools' return ports."))
        products.append(PoolData(label: "Above-Ground Pumps", image: "PowerFloAG", description: "This smaller, yet powerful pump and motor is what keeps the water flowing through the filter in your Above-Ground Pool. The heart of your circulation system, your pool pump, pulls water from one or more suction ports (i.e., skimmer & main drain), and then pushes it through the filter & heater (if you have one) and back to the pools' return ports."))
        
        return PoolCategory(menu: "Pool Pumps", group: products)
    }
    
    // All rows within the Equipment category
    private class func poolEquipment() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Pool Heaters", image: "heater", description: "Safety stuff"))
        products.append(PoolData(label: "Pool Skimmer", image: "skimmer", description: "Filter valves"))
        products.append(PoolData(label: "Timers", image: "timer", description: "Safety stuff"))
        products.append(PoolData(label: "Automatic Pool Cleaners", image: "autocleaner", description: "The automatic pool cleaner is a device that leapt right into the hearts of pool owners and service technicians alike. In a genesis similar to that of human air flight, engineers and inventors have produced gadgets of fancy in the hopes of finding one that will fly. Several have achieved wide-spread use and acceptance by consumers and the service industry. These are described below and are broken into three categories; Suction Side Cleaners, Pressure Side Cleaners and Robotic Pool Cleaners."))
        products.append(PoolData(label: "Water Valves", image: "mpValve", description: "The multiport valve, also called MPV valves, mounts on to bulkhead fittings on the side of a Sand or D.E. filter. Many sand filters use a top mounted multiport valve, located on the top center of the filter tank. The advantages of a Multiport valve are that they have, well, multiple ports. This allows for more options than simply Filter or Backwash.\n\nMultiport valves usually have 6 positions (Some Jacuzzi valves have 7 and some American valves have 8). The positions are usually labeled: Filter, Backwash, Rinse,Example of a Multiport Valve Recirculate, Closed and Drain/Waste. These are described below in more detail.\n\nWhen you move the multiport valve from Filter to Backwash, (always shut pump off first) you are reversing the direction of water into and out of the filter. This is where we get the word \"back-wash\", from sending the water backwards thru the pool filter tank during backwashing."))
        products.append(PoolData(label: "Chemical Feeders", image: "chlorinator", description: "Swimming Pool Chlorinators and chlorine feeders make introducing a sanitizer into your pool or spas water simplistic. Just fill the chlorine feeder with chlorine tablets or sticks, and select a setting on the dial. Regulate the chemical feeder to the desired setting and allow the chemical reserve to be depleted before refilling. A reliable chemical feeder will limit your maintenance. The type of pool chemical feeder you use depends on the type and size of pool or spa you have. Below is a summary of the major types of chlorinators available for the residential swimming pool market."))
        products.append(PoolData(label: "Safety Items", image: "rules", description: "Welcome to the safety archive! Using common sense, caution and standard practices can keep chemical applicators and pool users safe from harm. I wish to acknowledge the National Spa & Pool Institute for their work in pool and spa safety and their contributions to this page. Visit the Poolcenter.com Library for links to other safety sites we recommend. Safety around a swimming pool is an issue addressed by pool & spa professionals, their trade associations, and your local government in cooperation with consumer focus groups. Consumer Product Safety Commission has produced a page on pool safety and safety products. Pools and spas are not considered dangerous, yet the lack of proper precaution or available safety products can create hazardous conditions or liability concerns for the pool owner. Drowning can occur in a split second to people of all ages and swimming ability. Spinal injuries continue to happen from improper diving, to slip and fall cases that could end up in court, to the use of hazardous materials requiring a visit to the emergency room.  The information below is divided into 2 categories:  1 - Drowning & Accident Prevention and 2 - Chemical Use and Storage Safety."))
        products.append(PoolData(label: "Recreational", image: "slide", description: "The TurboTwister gives you water park thrills in your own backyard! Whether it's the rushing water or thrilling dips and curves that you love, this slide is packed with tons of great features for the entire family, accommodating children and adults, up to 275-lbs. Safety is a top priority; with sturdy molded-in handrails, easy grab sides, and enclosed ladder and steps. Standing over 7' tall at the top of the runway, offering an adjustable, generous water delivery system, slides are scratch resistant, fade resistant and vacuum-formed for strength and durability. Hooks up to a garden hose, plumbs into your pool return system or use with no running water at all.\n\nThe TurboTwister offers simple installation, the lightweight pieces are easily managed, assembling in less than 1 hour (excluding plumbing and mounting to deck), each joint comes complete with built-in sealents for a no-leak guarantee. Available with left or right side curves, and two natural tones, Sandstone and Gray Granite to accommodate the latest in backyard decor."))
        
        return PoolCategory(menu: "Pool Equipment", group: products)
    }
    
    // All rows within the Maintenance Equipment category
    private class func cleaningEquipment() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Telepole", image: "telepole", description: "A 3-Piece Telescopic pole makes pool cleaning easy connecting to just about any pool cleaning accessory and extending your reach so you don't have to strain your back. It extends from 5 to 15 ft. allowing for use in the largest pools and those hard to reach areas. The Telescopic pole is made up of a high quality anodized aluminum that won't corrode or rust giving you years of easy pool maintenance."))
        products.append(PoolData(label: "Pool Brush", image: "brush", description: "Safety stuff"))
        products.append(PoolData(label: "Concrete Vacuum Head", image: "concreteVacuum", description: "Filter valves"))
        products.append(PoolData(label: "Vinyl Vacuum Head", image: "vinylVacuum", description: "Safety stuff"))
        products.append(PoolData(label: "Vacuum Hose", image: "vacuumHose", description: "Filter valves"))
        products.append(PoolData(label: "Leaf Rake", image: "leafRake", description: "Filter valves"))
        products.append(PoolData(label: "Leaf Skimmer", image: "leafSkimmer", description: "Safety stuff"))
        products.append(PoolData(label: "Pool Skimmer", image: "skimmer", description: "Filter valves"))
        products.append(PoolData(label: "Skimmer Parts", image: "skimmerBasket", description: "Safety stuff"))
        
        
        return PoolCategory(menu: "Cleaning Equipment", group: products)
    }
    
    // All rows within the Chlorine category
    private class func chlorineTypes() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Chlorine Tablets", image: "singletablets", description: "These 3” (or also available in a smaller 1\" tablet) Tri-Chlor Jumbo Tabs fit perfectly in most chemical feeders to ensure proper and simple sanitation for your swimming pool. These tablets are densely compacted and erode at a slow rate that provides constant chlorination, increased lifespan, and a better value. With 90% available chlorine, our Jumbo Tabs are among the strongest available on the market today.\n\nChlorine Tablets are designed with a built-in UV inhibitor that protects the chlorine in your pool against the harsh sun rays. The active inhibitor blocks the sun rays to ensure longer lasting sanitation in your swimming pool. These tablets don’t contain fillers or binders in order to ensure effectiveness and sparkling clean pool water."))
        products.append(PoolData(label: "Calcium Hypochlorite", image: "calhypo-1", description: "This well known coarse grain chlorine is a powerful pool shock that quickly takes care of any bacteria, algae, or contaminants due to it's quick dissolving properties. Shocking your pool or spa regularly is necessary to keep your pool free of any unwanted contaminants which helps your chlorine work better and more efficiently. Calcium hypochlorite and has 73% available chlorine which leaves your pool clear, clean, and ready to use. Shocking your pool and spa also restores chlorine levels and frees up Combined Available Chlorine. Calcium Hypochlorite is the quick choice for many pool owners and professionals due to it's strong blend and ease of use which keeps your water sparkling year round."))
        products.append(PoolData(label: "Chlorine Generator", image: "chlorineGenerator", description: "One of the first alternative sanitizers introduced to the pool and spa industry was the chlorine generator. Chlorine generators are attractive to pool owners simply because they eliminate the need to store, buy, transport and handle chlorine. They are not an alternative to chlorine, but actually make their own chlorine from regular table salt. The pool water passes through a generator cell that creates the chlorine within the pool water.\n\nHow Does It Work?\n\nAs pool water passes through the chlorine generator cell, pumped through by your filter pump, the salt in the water is turned into Hypochlorous acid. Hypochlorous acid is the exact same component that is produced when any chlorine is added to pool water, whether you use sticks, tablets, granular or liquid. As the water returns to the pool, it will introduce the newly produced chlorine, preventing algae, bacteria and killing micro-organisms, creating a safe and sanitary swimming environment.\n\nOK?  How does it really work?\n\nThis mild, pleasant saline water is sanitized through the process of electrolysis, as mentioned above. The electrolytic cell, through the use of a small electric current, breaks down the water into its basic elements, Hydrogen and Oxygen. By adding small quantities of granulated salt (much like household table salt - NaCI), Hypochlorous Acid (common chlorine) is produced. During the process, the Hypochlorous Acid (Chlorine) is ultimately converted back to salt. Thus, the salt does not get \"used up\". Salt only needs to be \"topped off\" once or twice a year and only to replace salt lost due to water splash-out, bather drag off or filter backwashing.\n\nSalt in My Pool?\n\nThe salt level required to maintain a safe, chlorinated pool is about 2500 to 4000 PPM (parts per million). The human body cannot taste salt until the PPM is around 5000. As a reference point, the ocean is around 40000 ppm. The amount of salt in the pool is usually not noticeable. Once the salt is added to the pool, there is no need to add salt on a yearly basis unless the pool is drained or a significant amount of water is removed. Also, the salt level is low enough so there is no danger of equipment corrosion. Chlorine generator users also report the water is softer, leaving a more refreshed feeling after swimming."))
        
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
        products.append(PoolData(label: "Water Clarifier", image: "clarifier", description: "Also called a coagulant or flocculant. A chemical compound used to coagulate, clump or precipitate suspended micro particles so they can be removed by vacuuming or filtration. There are two main types; inorganic salts of aluminum (alum), or organic polyelectrolytes."))
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