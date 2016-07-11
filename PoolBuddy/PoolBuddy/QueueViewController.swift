//
//  QueueViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/5/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class QueueViewController: UIViewController {

    // Outlet collection array of webviews
    @IBOutlet var images: [UIImageView]!
    
    // Local variables
    var urlImages: [String] = []
    
    var myConcurrentQueue: dispatch_queue_t!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Url's assigned to constants
        let url1  = ""
        let url2  = ""
        let url3  = ""
        let url4  = ""
        let url5  = ""
        let url6  = ""
        let url7  = ""
        let url8  = ""
        let url9  = ""
        let url10 = ""
        let url11 = ""
        let url12 = ""
        
        // Array of URL's
        urlImages = [url1, url2, url3, url4, url5, url6, url7, url8, url9, url10, url11, url12]
        
        myConcurrentQueue = dispatch_queue_create("quickerUniqueString", DISPATCH_QUEUE_CONCURRENT)
    }
    
    // Action button outlets
    
    // Action to download images concurrently
    @IBAction func concurrent(sender: UIButton) {
        
        for (image, pic) in [(images[0], urlImages[0]), (images[1], urlImages[1]), (images[2], urlImages[2]), (images[3], urlImages[3]), (images[4], urlImages[4]), (images[5], urlImages[5]), (images[6], urlImages[6]), (images[7], urlImages[7])] { //, (images[8], urlImages[8]), (images[9], urlImages[9]), (images[10], urlImages[10]) {
            
            // Dispatch to new CONCURRENT QUEUE
            dispatch_async(myConcurrentQueue, {
                
                if let myURL = NSURL(string: pic) {
                    
                    let urlImage = image
                    
                    if let data = NSData(contentsOfURL: myURL) {
                        
                        // Dispatch back out to main queue
                        dispatch_sync(dispatch_get_main_queue(), {
                            
                            urlImage.image = UIImage(data: data)
                        })
                    }
                }
            })
        }
    }
}

