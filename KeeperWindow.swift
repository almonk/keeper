//
//  KeeperWindow.swift
//  Keeper
//
//  Created by Alasdair Monk on 31/08/2016.
//  Copyright © 2016 Alasdair Monk. All rights reserved.
//

import Cocoa

class KeeperWindow: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        self.hideEverything()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    func hideEverything() {
        window?.opaque = false
        window?.backgroundColor = NSColor.clearColor()
        //window?.styleMask = NSFullSizeContentViewWindowMask
        window?.styleMask =  NSTitledWindowMask | NSFullSizeContentViewWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask
        window?.titlebarAppearsTransparent = true
        window?.standardWindowButton(NSWindowButton.CloseButton)?.hidden = true
        window?.standardWindowButton(NSWindowButton.MiniaturizeButton)?.hidden = true
        window?.standardWindowButton(NSWindowButton.ZoomButton)?.hidden = true
        window?.titleVisibility = NSWindowTitleVisibility.Hidden
        window?.hasShadow = false
    }
    
    func makeFullHeight() {
        let windowOriginPoint = CGPoint(x: 10, y: 0)
        let windowSize = CGSize(width: 390, height: NSScreen.mainScreen()!.frame.size.height)
        window?.setFrame(NSRect(origin: windowOriginPoint, size: windowSize), display: true)
    }

}
