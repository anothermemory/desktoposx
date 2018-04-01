//
//  MemoriesListViewController.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 4/2/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa
import ReSwift
import AppKit

class MemoriesListViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource, StoreSubscriber {
    @IBOutlet var memoriesListView: NSOutlineView?

    var items: [MemoriesListItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        appStore.subscribe(self) { subscription in
            subscription.select { (state: AppState) in
                state.memoriesState
            }
        }

        guard let memoriesListView = memoriesListView else {
            return
        }

        memoriesListView.dataSource = self
        memoriesListView.delegate = self
    }

    func newState(state: MemoriesState) {
        guard let view = memoriesListView else {
            return
        }
        items = prepareListItems(from: state.memories)
        view.reloadData()
        expandHeaders()
    }

    func expandHeaders() {
        guard let view = memoriesListView else {
            return
        }
        for item in items {
            view.expandItem(item)
        }
    }

    func prepareListItems(from memories: [AMMemory]) -> [MemoriesListItem] {
        let items = MemoriesListItem(name: "Memories", type: .header)
        for memory in memories {
            let item = MemoriesListItem(name: memory.name, type: .plain, image: NSImage(named: NSImage.Name.bookmarksTemplate)!)
            item.memory = memory
            items.children.append(item)

        }
        return [items]
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        guard let item = item as? MemoriesListItem else {
            return false
        }
        return item.isExpandable
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        guard let item = item as? MemoriesListItem else {
            return items.count
        }
        return item.children.count
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        guard let item = item as? MemoriesListItem else {
            return items[index]
        }
        return item.children[index]
    }

    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        guard let item = item as? MemoriesListItem else {
            return false
        }
        return item.type == .header
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        guard let item = item as? MemoriesListItem else {
            return nil
        }

        guard let cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init(rawValue: item.cellId), owner: self) as? NSTableCellView else {
            return nil
        }

        cell.textField?.stringValue = item.name
        cell.imageView?.image = item.image

        return cell
    }

    func outlineView(_ outlineView: NSOutlineView, shouldShowOutlineCellForItem item: Any) -> Bool {
        return false
    }
}
