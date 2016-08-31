//
//  ViewController.swift
//  Keeper
//
//  Created by Alasdair Monk on 31/08/2016.
//  Copyright © 2016 Alasdair Monk. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WebFrameLoadDelegate {
    
    @IBOutlet var website: WebView!

    override func viewDidLoad() {
//        let storage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
//        for cookie in storage.cookies! {
//            storage.deleteCookie(cookie)
//        }
        
        super.viewDidLoad()
        website.frameLoadDelegate = self
        website.drawsBackground = false
        website.mainFrameURL = "https://keep.google.com"
        website.hidden = true
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
        let currentUrl = sender.mainFrameURL;
        
        if currentUrl.rangeOfString("accounts.google.com") == nil{
            // We're in the main app
            // so lets setup the window
            
            let windowOriginPoint = CGPoint(x: 10, y: 0)
            let windowSize = CGSize(width: 390, height: NSScreen.mainScreen()!.frame.size.height)
            NSApp.mainWindow!.setFrame(NSRect(origin: windowOriginPoint, size: windowSize), display: true)
            
            website.stringByEvaluatingJavaScriptFromString("function addStyleString(str) { var node = document.createElement('style'); node.innerHTML = str; document.body.appendChild(node);} addStyleString('#gb, .QT3Do { display:none }'); addStyleString('.gb_4c { height: 0px!important; }'); addStyleString('html,body { background-color: transparent!important; }');")
        }
        
        website.hidden = false
    }

}

