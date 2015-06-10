//
//  AppDelegate.swift
//  SimulateKeyboard
//
//  Created by Anders Hovmöller on 10/06/15.
//  Copyright (c) 2015 Anders Hovmöller. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var input: NSTextFieldCell!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    @IBAction func gotInput(sender: AnyObject) {
        NSApplication.sharedApplication().hide(self)
    }
    
    func applicationDidHide(notification: NSNotification) {
        var error: NSDictionary?
        let task = NSTask()
        task.launchPath = "/usr/bin/osascript"
        task.arguments = ["-e", "tell application \"System Events\" to keystroke \"\(self.input.stringValue)\""]
        task.launch()
        self.input.stringValue = ""
    }
}


class MainWindow: NSWindow {
    override var canBecomeKeyWindow: Bool {
        return true
    }

    override var canBecomeMainWindow: Bool {
        return true
    }
}
