//
//  CustomWebViewController.swift
//  GettingStartedWithSafariViewController
//
//  Created by Jordan Morgan on 6/25/15.
//  Copyright © 2015 Jordan Morgan. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class CustomWebViewController: UIViewController {
    
    var urlString:String?
    fileprivate var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = UIWebView(frame: self.view.frame)
        var url:URL
        
        if let desiredURL = urlString {
            url = URL(string: desiredURL)!
        } else {
            url = URL(string: "https://www.youtube.com/watch?v=vMpJGdhrO08")!
        }
        
        webView.loadRequest(URLRequest(url: url))
        self.view.addSubview(webView)
    }

    //Closes the browser and dismisses this view controller.
    @IBAction func close(_ sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
