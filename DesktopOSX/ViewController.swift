//
//  ViewController.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 3/5/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa
import ReSwift

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    override func viewWillAppear() {
        super.viewWillAppear()
//
//        appStore.subscribe(self) { (subscription: Subscription<AppState>) -> Subscription<MemoriesState> in
//            subscription.select { (state: AppState) -> MemoriesState in
//                state.memoriesState
//            }
//        }

        appStore.subscribe(self) { subscription in
            subscription.select { (state: AppState) in
                state.memoriesState
            }
        }
    }

    override func viewWillDisappear() {
        super.viewWillDisappear()
    }
}

extension ViewController: StoreSubscriber {
    func newState(state: MemoriesState) {
//        let alert: NSAlert = NSAlert()
//        alert.messageText = "New memories"
//        alert.informativeText = state.memories.reduce("", {result, memory in
//           result + "," + memory.name
//        })
//        alert.alertStyle = .informational
//        alert.addButton(withTitle: "OK")
//        alert.runModal()
    }
}
