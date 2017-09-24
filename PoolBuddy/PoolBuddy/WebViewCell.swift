//
//  WebViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 9/9/17.
//  Copyright © 2017 Full Sail. All rights reserved.
//

import UIKit
import SwiftWebVC

class WebViewCell: UIViewController {
    
    // MARK: Modal
    @IBAction func presentModalWithDefaultTheme() {
        let webVC = SwiftModalWebVC(urlString: "www.google.com")
        self.present(webVC, animated: true, completion: nil)
    }
}
