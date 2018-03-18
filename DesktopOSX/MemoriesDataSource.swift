//
// Created by VIACHESLAV ENIS on 3/16/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Foundation
import AppKit
import ReSwift

class MemoriesDataSource: NSObject, NSOutlineViewDataSource, NSOutlineViewDelegate, StoreSubscriber {
    var memoriesView: NSOutlineView!

    init(memoriesView: NSOutlineView) {
        self.memoriesView = memoriesView
    }
    func newState(state: MemoriesState) {
        self.memoriesView.reloadData()
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if item == nil {
            return 1
        }
        return appStore.state.memoriesState.memories.count
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if item == nil {
            return 1
        }
        return appStore.state.memoriesState.memories[index]
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
