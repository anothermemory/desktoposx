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
        appStore.dispatchOnMain(AppStartedAction())

        var timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            var memories = [AMMemory]()
            for _ in 0...100 {
                memories.append(AMMemory(name: randomString(length: 10)))
            }
            appStore.dispatchOnMain(SetMemoriesAction(memories: memories))
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

func randomString(length: Int) -> String {

    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)

    var randomString = ""

    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }

    return randomString
}
