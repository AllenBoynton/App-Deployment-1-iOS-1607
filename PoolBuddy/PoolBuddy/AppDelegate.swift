//
//  AppDelegate.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 6/29/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func dateComponentFromNSDate(_ date: Date)-> DateComponents{
        
        let calendarUnit: NSCalendar.Unit = [.hour, .day, .month, .year]
        let dateComponents = (Calendar.current as NSCalendar).components(calendarUnit, from: date)
        return dateComponents
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = UIColor.white
        }
        UIApplication.shared.statusBarStyle = .lightContent

        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor.white  // Nav bar items
        navigationBarAppearace.barTintColor = UIColor.black  // Bar's background color
        
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white] // setting constant color for all bar button items
        
        let customFont = UIFont(name: "KittenSlant", size: 17) // setting font for bar button back item
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: customFont!], for: UIControlState())
        
        let toolBar = UIToolbar.appearance()
        
        toolBar.barTintColor = UIColor.white // Toolbar's color
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

