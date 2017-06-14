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

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    @IBAction func gotInput(_ sender: AnyObject) {
        NSApplication.shared().hide(self)
    }
    
    func applicationDidHide(_ notification: Notification) {
        var _: NSDictionary?
        let task = Process()
        task.launchPath = "/usr/bin/osascript"
        task.arguments = ["-e", "tell application \"System Events\" to keystroke \"\(self.input.stringValue)\""]
        task.launch()
        self.input.stringValue = ""
    }
}


class MainWindow: NSWindow {
    override var canBecomeKey: Bool {
        return true
    }

    override var canBecomeMain: Bool {
        return true
    }
}
