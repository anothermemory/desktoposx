//
//  AMUnitViewController.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 4/9/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa

class AMUnitViewController: NSViewController {
    @IBOutlet var unitView: NSStackView!
    @IBOutlet var unitHeaderView: NSView!
    @IBOutlet var unitBodyView: NSView!

    var unitHeaderViewController: AMUnitHeaderViewController!

    var unit: AMUnit! //TODO:Subscribe to the store units[unitid]

    override func viewDidLoad() {
        super.viewDidLoad()

        loadHeaderView()
    }

    private func loadHeaderView() {
        unitHeaderViewController = StoryboardScene.Units.amUnitHeaderViewController.instantiate()
        addChildViewController(unitHeaderViewController)
        unitHeaderView.addSubview(unitHeaderViewController.view)

        unitHeaderViewController.unitTitleField?.stringValue = unit.title
    }
}
