//
//  AMMemoryViewController.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 4/2/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa

class AMMemoryViewController: NSViewController {
    @IBOutlet var unitsTableView: NSTableView!

    let dataSource = AMUnitsTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        for i in 1...100 {
            if i % 2 == 0 {
            dataSource.units.append(AMUnitTextPlain(uid: UUID().uuidString, title: "Textx Unit # \(i)", created: Date(), updated: Date().addingTimeInterval(3600), data: "Some text data \(i)"))
            } else {
            dataSource.units.append(AMUnitTextMarkdown(uid: UUID().uuidString, title: "Markdown Unit # \(i)", created: Date(), updated: Date().addingTimeInterval(3600), data: "Some text data \(i)"))
            }
        }

//        dataSource.units.append(AMUnitTextPlain(uid: UUID().uuidString, title: "My First Unit", created: Date(), updated: Date(), data: "Some text data"))
//        dataSource.units.append(AMUnitTextPlain(uid: UUID().uuidString, title: "My Second Unit", created: Date(), updated: Date(), data: "Some text data"))

        unitsTableView.dataSource = dataSource
        unitsTableView.delegate = dataSource
        unitsTableView.selectionHighlightStyle = .none

        unitsTableView.reloadData()
    }
    
}
