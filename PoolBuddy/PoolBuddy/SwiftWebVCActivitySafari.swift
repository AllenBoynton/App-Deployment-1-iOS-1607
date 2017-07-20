//
//  SwiftWebVCActivitySafari.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class SwiftWebVCActivitySafari : SwiftWebVCActivity {
    
    override var activityTitle : String {
        return NSLocalizedString("Open in Safari", tableName: "SwiftWebVC", comment: "")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for activityItem in activityItems {
            if let activityItem = activityItem as? URL, UIApplication.shared.canOpenURL(activityItem) {
                return true
            }
        }
        return false
    }
    
    override func perform() {
        let completed: Bool = UIApplication.shared.openURL(URLToOpen! as URL)
        activityDidFinish(completed)
    }
    
}
