//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by John Cook on 5/29/16.
//  Copyright © 2016 John Cook. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var webView: WKWebView!
    
    let homepage = "https://www.airbnb.com"
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string: homepage)
        let request    = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
}
