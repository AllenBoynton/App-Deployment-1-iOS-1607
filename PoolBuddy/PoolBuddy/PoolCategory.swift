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
        return [self.chemicalSafety(), self.chlorineTypes(), self.poolChemicals()]
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
        
        products.append(PoolData(label: "DE Filter", image: "DEFilter", label2: "", image2: "", description: "Many pool professionals consider D.E. filtration to be the finest, because it is capable of removing smaller particles than either sand or cartridge filters. Clear water can pass through these openings, but particles as small as one to three microns are trapped during the first pass through the media. Pro Grid includes a manual air-relief valve and a top-mounted pressure gauge for easy access and readability. The high-impact grid elements are designed for up-flow filtration and top-down backwashing for maximum efficiency. An integral lift handle and low-profile base make removal of the grid assembly fast and simple. Combining these high-technology features and a 'service-ease' design for an unparalleled filtration value, the D.E. Filter is for the quality conscious pool owner."))
        products.append(PoolData(label: "Sand Filter", image: "sandFilter", label2: "", image2: "", description: "The sand in a pool sand filter (#20 silica sand; 45 - 55 mm) is specially graded to trap particles in the 20 - 100 micron range. As a sand filter collects dirt, its efficiency increases, trapping more dirt. When your pressure gauge shows a reading 8 - 10 lbs. over the clean, start-up reading, it is time to backwash the captured dirt out of the filter. \nSand filters are known to be the lowest maintenance of the three types of pool filters. You may only need to open up the tank every 5 years or so. DE filters require removing the internal grid assembly at least annually to clean them well, and cartridge filters don't backwash, you remove the cartridge and hose clean every so often, depending on the cartridge filter size. Sand filters are the easiest to operate and maintain.\n\"They say\" that the sand inside a sand filter should be replaced after seven years. Gradual loss of efficiency may be hard to notice. If your sand filter requires frequent backwashing, every week or two, the sand bed may be \"mudballed\", or it may be \"channeled\". It may also \"calcify\" with calcium deposits. Other water balance problems may also contribute to pool filter sand deterioration, but a properly sized sand filter could go over 10 years between sand changes."))
        products.append(PoolData(label: "Cartridge Filter", image: "cartridgeFilter", label2: "", image2: "", description: "Filter of choice for most spas, and many smaller above ground pools, the cartridge filter is enjoying a resurgence in popularity. The cartridge filter element, an aquatic version of the pleated air filter in your car, traps dirt and particles of 25 - 100 microns in size. The cartridge is removed from the tank and hosed thoroughly, top to bottom, with a high pressure hose to remove dirt when the pressure gauge rises 8 - 10 lbs. above its clean reading. I know some people that take their cartridges to the local self serve car wash place for cleaning, but too much pressure may damage the cartridge. Each time the cartridge filter element is cleaned, some of its filtering ability is reduced.\nThe cartridge should be replaced every 3 - 5 yrs, depending on the work it was asked to do. If the filter was a bit undersized, and had some algae every year and lots of tree debris, etc. then it may last only 1 - 2 years. Nicely sized cartridge filters can operate for 6 months between cleanings and get more than 5 yrs from the cartridges."))
        
        return PoolCategory(menu: "Pool Filters", group: products)
    }
    
    // All rows within the Pump category
    private class func poolPumps() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Inground Pumps", image: "Super-Pump", label2: "", image2: "", description: "This larger pump and motor is what keeps the water flowing through the filter in your In-Ground Pool. The heart of your circulation system, your pool pump, pulls water from one or more suction ports (i.e., skimmer & main drain), and then pushes it through the filter & heater (if you have one) and back to the pools' return ports."))
        products.append(PoolData(label: "Above-Ground Pumps", image: "PowerFloAG", label2: "", image2: "", description: "This smaller, yet powerful pump and motor is what keeps the water flowing through the filter in your Above-Ground Pool. The heart of your circulation system, your pool pump, pulls water from one or more suction ports (i.e., skimmer & main drain), and then pushes it through the filter & heater (if you have one) and back to the pools' return ports."))
        
        return PoolCategory(menu: "Pool Pumps", group: products)
    }
    
    // All rows within the Equipment category
    private class func poolEquipment() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Pool Heaters", image: "heater", label2: "Heat Pumps", image2: "heatPump", description: "Gas Heaters: Gas pool heaters use either natural gas or propane. As the pump circulates the pool's water, the water drawn from the pool passes through a filter and then to the heater. The gas burns in the heater's combustion chamber, generating heat that transfers to the water that's returned to the pool.\nThey're most efficient when heating pools for short periods of time, and they're ideal for quickly heating pools. Therefore, gas pool heaters can be a good choice for pools that aren't used on a regular basis. Unlike heat pump and solar pool heaters, gas pool heaters can maintain any desired temperature regardless of the weather or climate.\n\nHeat Pumps: Heat pumps use electricity to capture heat and move it from one place to another. They don't generate heat.\nAs the pool pump circulates the swimming pool's water, the water drawn from the pool passes through a filter and the heat pump heater. The heat pump heater has a fan that draws in the outside air and directs it over the evaporator coil. Liquid refrigerant within the evaporator coil absorbs the heat from the outside air and becomes a gas. The warm gas in the coil then passes through the compressor. The compressor increases the heat, creating a very hot gas that then passes through the condenser. The condenser transfers the heat from the hot gas to the cooler pool water circulating through the heater. The heated water then returns to the pool. The hot gas, as it flows through the condenser coil, returns to liquid form and back to the evaporator, where the whole process begins again."))
        products.append(PoolData(label: "Timers", image: "timer", label2: "", image2: "", description: "Having your filter pump operate on a timer clock makes good sense. Most pools have efficiency in sanitizing, filtering and circulation such that they don't need to operate 24 hours a day. Pools are designed to \"turnover\" the water in the pool in eight hours time. We commonly set time clocks to operate 10 - 14 hours per day, depending on the efficiency of the system, the ambient air temperature, amount of sunlight and debris and the usage the pool receives.\nI commonly advise pool owners to operate the filter system during the day, so that processes are active while the sun is beating down and the pool is most likely to be in use. This would be something like 9 a.m. - 9 p.m. You may realize lower electrical consumption if you didn't operate between 12 p.m. - 6 p.m.... peak sunlight hours.... You decide.\nSetting a time clock is simple. Inside the box you'll see a 24 hour dial. There are two \"timer dogs\" on the dial. One turns the timer switch on, allowing power to go to the filter pump, and the other turns the switch off, stopping power from going past the timer to the filter pump. Loosening the small screw on the timer dog allows you to slide the dog to any time on the dial. Reposition and retighten."))
        products.append(PoolData(label: "Automatic Pool Cleaners", image: "autocleaner", label2: "", image2: "", description: "The automatic pool cleaner is a device that leapt right into the hearts of pool owners and service technicians alike. In a genesis similar to that of human air flight, engineers and inventors have produced gadgets of fancy in the hopes of finding one that will fly. Several have achieved wide-spread use and acceptance by consumers and the service industry. These are described below and are broken into three categories; Suction Side Cleaners, Pressure Side Cleaners and Robotic Pool Cleaners."))
        products.append(PoolData(label: "Water Valves", image: "mpValve", label2: "Water Diverter Valve", image2: "jandyValve", description: "The multiport valve, also called MPV valves, mounts on to bulkhead fittings on the side of a Sand or D.E. filter. Many sand filters use a top mounted multiport valve, located on the top center of the filter tank. The advantages of a Multiport valve are that they have, well, multiple ports. This allows for more options than simply Filter or Backwash.\n\nMultiport valves usually have 6 positions (Some Jacuzzi valves have 7 and some American valves have 8). The positions are usually labeled: Filter, Backwash, Rinse,Example of a Multiport Valve Recirculate, Closed and Drain/Waste. These are described below in more detail.\n\nWhen you move the multiport valve from Filter to Backwash, (always shut pump off first) you are reversing the direction of water into and out of the filter. This is where we get the word \"back-wash\", from sending the water backwards thru the pool filter tank during backwashing."))
        products.append(PoolData(label: "Chemical Feeders", image: "chlorinator", label2: "", image2: "", description: "Swimming Pool Chlorinators and chlorine feeders make introducing a sanitizer into your pool or spas water simplistic. Just fill the chlorine feeder with chlorine tablets or sticks, and select a setting on the dial. Regulate the chemical feeder to the desired setting and allow the chemical reserve to be depleted before refilling. A reliable chemical feeder will limit your maintenance. The type of pool chemical feeder you use depends on the type and size of pool or spa you have. Below is a summary of the major types of chlorinators available for the residential swimming pool market."))
        products.append(PoolData(label: "Safety Items", image: "rules", label2: "Safety Pool Covers", image2: "safetycover", description: "Welcome to the safety archive! Using common sense, caution and standard practices can keep chemical applicators and pool users safe from harm. I wish to acknowledge the National Spa & Pool Institute for their work in pool and spa safety and their contributions to this page. Visit the Poolcenter.com Library for links to other safety sites we recommend. Safety around a swimming pool is an issue addressed by pool & spa professionals, their trade associations, and your local government in cooperation with consumer focus groups. Consumer Product Safety Commission has produced a page on pool safety and safety products. Pools and spas are not considered dangerous, yet the lack of proper precaution or available safety products can create hazardous conditions or liability concerns for the pool owner. Drowning can occur in a split second to people of all ages and swimming ability. Spinal injuries continue to happen from improper diving, to slip and fall cases that could end up in court, to the use of hazardous materials requiring a visit to the emergency room.  The information below is divided into 2 categories:  1 - Drowning & Accident Prevention and 2 - Chemical Use and Storage Safety."))
        products.append(PoolData(label: "Recreational", image: "slide", label2: "Diving Board", image2: "diving", description: "The TurboTwister gives you water park thrills in your own backyard! Whether it's the rushing water or thrilling dips and curves that you love, this slide is packed with tons of great features for the entire family, accommodating children and adults, up to 275-lbs. Safety is a top priority; with sturdy molded-in handrails, easy grab sides, and enclosed ladder and steps. Standing over 7' tall at the top of the runway, offering an adjustable, generous water delivery system, slides are scratch resistant, fade resistant and vacuum-formed for strength and durability. Hooks up to a garden hose, plumbs into your pool return system or use with no running water at all.\n\nThe TurboTwister offers simple installation, the lightweight pieces are easily managed, assembling in less than 1 hour (excluding plumbing and mounting to deck), each joint comes complete with built-in sealents for a no-leak guarantee. Available with left or right side curves, and two natural tones, Sandstone and Gray Granite to accommodate the latest in backyard decor."))
        
        return PoolCategory(menu: "Pool Equipment", group: products)
    }
    
    // All rows within the Maintenance Equipment category
    private class func cleaningEquipment() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Telepole", image: "telepole", label2: "", image2: "", description: "The first thing you need. Telepoles, as they are called, come in a variety of lengths and quality. The best ones are made from fiberglass, but most are aluminum. They usually extend and then twist lock in place. Most tele-poles have 2 holes at the end that are designed to accept a wide range of accessories that we will discuss below.A 3-Piece Telescopic pole makes pool cleaning easy connecting to just about any pool cleaning accessory and extending your reach so you don't have to strain your back. It extends from 5 to 15 ft. allowing for use in the largest pools and those hard to reach areas. The Telescopic pole is made up of a high quality anodized aluminum that won't corrode or rust giving you years of easy pool maintenance."))
        products.append(PoolData(label: "Pool Brush", image: "brush", label2: "", image2: "", description: "One of the most overlooked maintenance steps of pool care is brushing. Swimming pools should be brushed at least once per week. Brushing removes algae and other films and dirt on pool walls and pool floors that can’t be removed by vacuuming. A weekly brushing will avoid “slimy” walls and slick film that is common with pools and spas. There are several types of pool brushes. Stainless steel is perfect for plaster or concrete pools. Stainless brushes should not be used on vinyl pools. Plastic bristle brushes can be used on any type of pools, and are ideal for above ground and vinyl pools. There are also brushes designed for getting into pool corners and steps. Don’t forget to brush your pool weekly!!"))
        products.append(PoolData(label: "Concrete Vacuum Head", image: "concreteVacuum", label2: "Vinyl Vacuum Head", image2: "vinylVacuum", description: "The easiest way to make a dirty pool look good is a good vacuuming. All pools need to be vacuumed on a regular basis. The vacuum head attaches to the pole, and then a vacuum hose is attached to the vacuum head. The pole and vacuum head are then lowered into the pool. There are two different types of vacuum heads. One has wheels and is weighted for concrete pools (Image shown above). The other is designed for vinyl lined pools, and has brushes instead of wheels (Shown above right)."))
        products.append(PoolData(label: "Leaf Bagger", image: "leafbagger", label2: "", image2: "", description: "One of the best inventions for swimming pool cleaning since the telescopic pole is the Leaf Bagger. Sometimes called the Leaf Master, The Leaf Bagger is a jet style vacuum that uses water pressure from your garden hose to create a Venturi affect. The high pressure water pushes the debris into a large bag. The leaf bagger is ideal for a quick spot clean or cleaning a pool floor full of leaves. Available with a leaf  bag, or a very fine mesh bag."))
        products.append(PoolData(label: "Vacuum Hose", image: "vacuumHose", label2: "", image2: "", description: "In order to vacuum debris from the pool walls and floor, you will need a vacuum hose. The vacuum hose connects to the vacuum head and telescoping pole (both above). Then, lowered into the pool. You then need to fill the vacuum hose with water, and then plug the end into the skimmer suction hole or a dedicated vacuum line. The water and debris are pulled into the filter pump basket via the swimming pool vacuum hose. After you vacuum, you will need to clean the basket and backwash the filter."))
        products.append(PoolData(label: "Pumice Stone", image: "pumice", label2: "", image2: "", description: "Another method for removing localized stains on concrete pools is the pumice stone. Pumice is a light porous glassy lava stone that can be rubbed over a pool stain to remove it. You can get a pumice stone that can attach to your tele-pole or a pumice stone that has a handle you can swim with. Works great on cement stains, berry stains and paint."))
        products.append(PoolData(label: "Leaf Skimmer", image: "leafSkimmer", label2: "Leaf Rake", image2: "leafrake",description: "The most popular pieces of equipment around the pool are the skim net (Upper center) and leaf rake (Upper right). The skim net is a flat mesh net that attaches to the tele pole. It should be used on a daily basis to remove debris floating on the pool surface before it can sink to the floor. The leaf rake is also a mesh net, but is much deeper. Great for scooping debris from the pool floor for a quick cleaning before guests arrive for instance."))
        products.append(PoolData(label: "Pool Skimmer", image: "skimmerunit", label2: "Skimmer Weir", image2: "", description: "A device installed in the wall of a pool that is connected to the suction line of the pump. The suction pulls in water and floating contaminants. The interface of the plastic skimmer to the concrete pool, plaster, tile and coping creates many opportunities for problems to occur. Common skimmer problems include: separation from the pool wall (beam), freeze damage, leaking or collapsed/ separated pipes (especially if flexible or black poly pipe was used).\n\nWeir Flap\n\nIf your skimmer weir (the flapper gate) has come out or broken, replace it with new. The weir creates a small waterfall into the basket which speeds up water flow, drawing more debris in. The weir also helps to keep debris in the skimmer neck when the pump shuts off. Similarly, replace a broken skimmer lid, before someone steps in it."))
        products.append(PoolData(label: "Skimmer Parts", image: "skimmer", label2: "Skimmer Basket", image2: "skimmerBasket", description: "SKIMMER BASKET: A removable basket or strainer placed in the skimmer, which is designed to trap large solids from the water before they get to the pump or filter."))
        
        return PoolCategory(menu: "Cleaning Equipment", group: products)
    }
    
    // All rows within the Chemical Safety category
    private class func chemicalSafety() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Chemical Safety", image: "Pool Chemical Safety", label2: "", image2: "", description: "While pool chemicals are available to solve almost all water problems, they can be dangerous to humans and animals if handled improperly. Chemicals can cause skin and eye damage and can be fatal if swallowed. To keep yourself and your pool safe, follow these pool chemical safety precautions:\n\n\u{2022} Keep all pool products away from children and animals.\n\u{2022} Wear rubber gloves and goggles, and wash clothes and hands immediately after handling chemicals. If your skin comes in contact with any chemicals, flush immediately with cold water for 15 minutes and call a physician.\n\u{2022} Follow the dosage directions and safety precautions listed on the pool product label.\n\u{2022} Store chemicals according to the manufacturer's instructions.\n\u{2022} Never return spilled material to the original container or place in the household garbage.\n\u{2022} Use clean, dry measuring equipment for chemicals. Rinse all measuring equipment after using.\n\u{2022} Don't mix spa, pool or household chemicals together.\n\u{2022} Add chemicals to water. Don't add water to chemicals. Adding water to chemicals contaminates the entire container.\n\u{2022} Don't allow dry chlorine to become damp or wet.\n\u{2022} Keep open flames away from pool chemicals.\n\u{2022} Don't reuse empty containers. Check with local, state and federal regulations for proper disposal.\n\u{2022} Discard any unused chemicals after closing your pool. Follow local ordinances for disposing of hazardous materials. Buy new chemicals when you reopen the pool."))
        
        return PoolCategory(menu: "Chemical Safety", group: products)
    }

    // All rows within the Chlorine category
    private class func chlorineTypes() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Chlorine Tablets", image: "singletablets", label2: "", image2: "", description: "These 3” (or also available in a smaller 1\" tablet) Tri-Chlor Jumbo Tabs fit perfectly in most chemical feeders to ensure proper and simple sanitation for your swimming pool. These tablets are densely compacted and erode at a slow rate that provides constant chlorination, increased lifespan, and a better value. With 90% available chlorine, our Jumbo Tabs are among the strongest available on the market today.\n\nChlorine Tablets are designed with a built-in UV inhibitor that protects the chlorine in your pool against the harsh sun rays. The active inhibitor blocks the sun rays to ensure longer lasting sanitation in your swimming pool. These tablets don’t contain fillers or binders in order to ensure effectiveness and sparkling clean pool water."))
        products.append(PoolData(label: "Calcium Hypochlorite", image: "calhypo-1", label2: "Dichlor", image2: "", description: "This well known coarse grain chlorine is a powerful pool shock that quickly takes care of any bacteria, algae, or contaminants due to it's quick dissolving properties. Shocking your pool or spa regularly is necessary to keep your pool free of any unwanted contaminants which helps your chlorine work better and more efficiently. Calcium hypochlorite and has 73% available chlorine which leaves your pool clear, clean, and ready to use. Shocking your pool and spa also restores chlorine levels and frees up Combined Available Chlorine. Calcium Hypochlorite is the quick choice for many pool owners and professionals due to it's strong blend and ease of use which keeps your water sparkling year round."))
        products.append(PoolData(label: "Chlorine Generator", image: "chlorineGenerator", label2: "", image2: "", description: "One of the first alternative sanitizers introduced to the pool and spa industry was the chlorine generator. Chlorine generators are attractive to pool owners simply because they eliminate the need to store, buy, transport and handle chlorine. They are not an alternative to chlorine, but actually make their own chlorine from regular table salt. The pool water passes through a generator cell that creates the chlorine within the pool water.\n\nHow Does It Work?\n\nAs pool water passes through the chlorine generator cell, pumped through by your filter pump, the salt in the water is turned into Hypochlorous acid. Hypochlorous acid is the exact same component that is produced when any chlorine is added to pool water, whether you use sticks, tablets, granular or liquid. As the water returns to the pool, it will introduce the newly produced chlorine, preventing algae, bacteria and killing micro-organisms, creating a safe and sanitary swimming environment.\n\nOK?  How does it really work?\n\nThis mild, pleasant saline water is sanitized through the process of electrolysis, as mentioned above. The electrolytic cell, through the use of a small electric current, breaks down the water into its basic elements, Hydrogen and Oxygen. By adding small quantities of granulated salt (much like household table salt - NaCI), Hypochlorous Acid (common chlorine) is produced. During the process, the Hypochlorous Acid (Chlorine) is ultimately converted back to salt. Thus, the salt does not get \"used up\". Salt only needs to be \"topped off\" once or twice a year and only to replace salt lost due to water splash-out, bather drag off or filter backwashing.\n\nSalt in My Pool?\n\nThe salt level required to maintain a safe, chlorinated pool is about 2500 to 4000 PPM (parts per million). The human body cannot taste salt until the PPM is around 5000. As a reference point, the ocean is around 40000 ppm. The amount of salt in the pool is usually not noticeable. Once the salt is added to the pool, there is no need to add salt on a yearly basis unless the pool is drained or a significant amount of water is removed. Also, the salt level is low enough so there is no danger of equipment corrosion. Chlorine generator users also report the water is softer, leaving a more refreshed feeling after swimming."))
        
        return PoolCategory(menu: "Chlorine", group: products)
    }
    
    // All rows within the Chemicals category
    private class func poolChemicals() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Oxidizer", image: "oxidizer", label2: "", image2: "", description: "IG pumps"))
        products.append(PoolData(label: "pH Increase", image: "phIncrease", label2: "", image2: "", description: "AG pumps"))
        products.append(PoolData(label: "pH Decrease", image: "dryAcid", label2: "", image2: "", description: "Safety stuff"))
        products.append(PoolData(label: "Alkalinity Increase", image: "alkalinityUp", label2: "", image2: "", description: "valves"))
        products.append(PoolData(label: "Hardness Increase", image: "hardnessPlus", label2: "", image2: "", description: "Safety stuff"))
        products.append(PoolData(label: "Cyanuric Acid", image: "conditioner", label2: "", image2: "", description: " valves"))
        products.append(PoolData(label: "Sequestering Agents", image: "sequestering", label2: "", image2: "", description: "Safety stuff"))
        products.append(PoolData(label: "Algaecides", image: "algaecide", label2: "", image2: "", description: "Filter valves"))
        products.append(PoolData(label: "Water Clarifier", image: "clarifier", label2: "", image2: "", description: "Also called a coagulant or flocculant. A chemical compound used to coagulate, clump or precipitate suspended micro particles so they can be removed by vacuuming or filtration. There are two main types; inorganic salts of aluminum (alum), or organic polyelectrolytes."))
        products.append(PoolData(label: "Enzymes", image: "perfect", label2: "", image2: "", description: "Filter valves"))
        products.append(PoolData(label: "Metal Removers", image: "metalFree", label2: "", image2: "", description: "IG pumps"))
        products.append(PoolData(label: "Stain Removers", image: "stain-remover", label2: "", image2: "", description: "AG pumps"))
        products.append(PoolData(label: "Cleaners", image: "sandRevitalizer", label2: "", image2: "", description: "AG pumps"))
        
        return PoolCategory(menu: "Pool Chemicals", group: products)
    }
    
    // All rows within the Water Chemistry category
    private class func waterChemistry() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Free Chlorine", image: "levels", label2: "", image2: "", description: "IG pumps"))
        products.append(PoolData(label: "Combined Chlorine", image: "dpdTest", label2: "", image2: "", description: "AG pumps"))
        products.append(PoolData(label: "pH (Power of Hydrogen)", image: "ph", label2: "", image2: "", description: "IG pumps"))
        products.append(PoolData(label: "Alkalinity", image: "testKit", label2: "", image2: "", description: "AG pumps"))
        products.append(PoolData(label: "Calcium Hardness", image: "waterTest1", label2: "", image2: "", description: "Safety stuff"))
        products.append(PoolData(label: "Cyanuric Acid", image: "testStrips", label2: "", image2: "", description: "valves"))
        products.append(PoolData(label: "TDS (Total Dissolved Solids)", image: "chemicals1", label2: "", image2: "", description: "Safety stuff"))
        products.append(PoolData(label: "Phosphates", image: "phosphates", label2: "", image2: "", description: "valves"))
        
        return PoolCategory(menu: "Water Chemistry", group: products)
    }
    
    // All rows within the Maintenance category
    private class func poolMaintenance() -> PoolCategory {
        
        var products = [PoolData]()
        
        products.append(PoolData(label: "Inground Pumps", image: "Super-Pump", label2: "", image2: "", description: "IG pumps"))
        products.append(PoolData(label: "Above-Ground Pumps", image: "PowerFloAG", label2: "", image2: "", description: "AG pumps"))
        
        return PoolCategory(menu: "Pool Maintenance", group: products)
    }
}