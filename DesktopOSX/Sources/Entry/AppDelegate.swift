//
//  AppDelegate.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 3/5/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa
import ReSwift

let appStore = createAppStore()

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        appStore.dispatchOnMain(AppStarted())
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
