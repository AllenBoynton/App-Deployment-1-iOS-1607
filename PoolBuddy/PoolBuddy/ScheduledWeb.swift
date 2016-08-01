//
//  ScheduledWeb.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/29/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ScheduledWeb: UIViewController, SFSafariViewControllerDelegate {
    
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Video Pool School"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        // Call URL using for the view
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.youtube.com/watch?v=vMpJGdhrO08")!))
        
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func backAction(sender: AnyObject) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardAction(sender: AnyObject) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refreshAction(sender: AnyObject) {
        webView.reload()
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        webView.stopLoading()
    }

    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    @IBAction func exitWebView(sender: AnyObject) {  // Exits web view
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        } else {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
