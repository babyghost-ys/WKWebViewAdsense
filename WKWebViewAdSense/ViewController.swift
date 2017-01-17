//
//  ViewController.swift
//  WKWebViewAdSense
//
//  Created by Peter Leung on 16/1/2017.
//  Copyright © 2017 winandmac Media. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate{
    
    @IBOutlet weak var internalWebView: UIView!
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let frame = CGRect(x: 0, y: 0, width: internalWebView.bounds.width, height: internalWebView.bounds.height)
        webView.frame = frame
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.internalWebView.addSubview(webView)
        webView.load(URLRequest(url: URL(string: "http://en.winandmac.com/")!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let requestedURL = navigationAction.request.url
        
        if navigationAction.navigationType == .linkActivated{
            print("You have clicked the requested URL \(requestedURL)")
            if requestedURL?.absoluteString.contains("doubleclick.net") == true{
                UIApplication.shared.open(requestedURL!, options: [:], completionHandler: nil)
                decisionHandler(.cancel)
            }
        }
        decisionHandler(.allow)
    }
    
    
}

