//
//  AMUnitsTableViewDataSource.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 4/2/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa

class AMUnitsTableViewDataSource: NSObject, NSTableViewDataSource, NSTableViewDelegate {
    var units: [AMUnit] = []

    func numberOfRows(in tableView: NSTableView) -> Int {
        return units.count
    }

    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return units[row]
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        let id = NSUserInterfaceItemIdentifier.init(rawValue: "AMUnitTextPlainView")
//        tableView.register(NSNib(nibNamed: NSNib.Name("AMUnitTextPlainView"), bundle: Bundle.main), forIdentifier: id)
        
//        let item = tableView.makeView(withIdentifier: id, owner: self)
        
        if units[row].type == .textPlain {
            let textItemView = AMUnitTextPlainView()
            textItemView.titleField?.stringValue = units[row].title
            textItemView.createdField?.stringValue = formatDate(units[row].created)
            textItemView.updatedField?.stringValue = formatDate(units[row].updated)
            
            return textItemView
        } else {
            let textItemView = AMUnitTextMarkdownView()
            textItemView.titleField?.stringValue = units[row].title
            return textItemView
        }
        
//        print(item)
//        guard let textItemView = item as? AMUnitTextPlainView else { return nil }

//        print("Guard passed")
//        textItemView.wantsLayer = true
//        textItemView.layer?.backgroundColor = NSColor.lightGray.cgColor
        
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss"
//        formatter.dateStyle = .full
//        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
}
