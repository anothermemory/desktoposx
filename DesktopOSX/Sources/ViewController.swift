//
//  ViewController.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 3/5/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa

import AppKit


class ViewController: NSViewController, NSOutlineViewDataSource, NSOutlineViewDelegate {

    @IBOutlet weak var memoriesView: NSOutlineView!
//    var memoriesDataSource: MemoriesDataSource!

//    var disposeBag = DisposeBag()
    var memories: [AMMemory] = []

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
        self.memoriesView.dataSource = self
        self.memoriesView.delegate = self

//        self.memoriesDataSource = MemoriesDataSource(memoriesView: self.memoriesView)
//        self.memoriesView.dataSource = self.memoriesDataSource
//        self.memoriesView.delegate = self.memoriesDataSource
//
//        appStore.subscribe(self) { (subscription: Subscription<AppState>) -> Subscription<MemoriesState> in
//            subscription.select { (state: AppState) -> MemoriesState in
//                state.memoriesState
//            }
//        }
//
//        appStore.subscribe(self) { subscription in
//            subscription.select { (state: AppState) in
//                state.memoriesState
//            }
//        }
//
//        appStore.subscribe(memoriesDataSource) { subscription in
//            subscription.select { (state: AppState) in
//                state.memoriesState
//            }
//        }

//        self.memoriesView.reloadData()
    }

    override func viewWillDisappear() {
        super.viewWillDisappear()
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if item == nil {
            return 1
        }
        return memories.count
        
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if item == nil {
            return 1
        }
        return memories[index]
    
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if item is Int {
            return true
        }
        return false
    }

    func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any? {
        return nil
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        if item is Int {
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as! NSTableCellView
            view.textField?.stringValue = "MEMORIES"
            return view
        }
        let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as! NSTableCellView
        view.textField?.stringValue = (item as! AMMemory).name
        return view
    }

    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        if item is Int {
            return true
        }
        return false
    }

}

//
//extension ViewController: StoreSubscriber {
//    func newState(state: MemoriesState) {
////        let alert: NSAlert = NSAlert()
////        alert.messageText = "New memories"
////        alert.informativeText = state.memories.reduce("", {result, memory in
////           result + "," + memory.name
////        })
////        alert.alertStyle = .informational
////        alert.addButton(withTitle: "OK")
////        alert.runModal()
//    }
//}
