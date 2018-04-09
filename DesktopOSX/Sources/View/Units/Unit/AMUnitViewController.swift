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

        unitHeaderViewController.view.topAnchor.constraint(equalTo: unitHeaderView.topAnchor).isActive = true
        unitHeaderViewController.view.bottomAnchor.constraint(equalTo: unitHeaderView.bottomAnchor).isActive = true
        unitHeaderViewController.view.leftAnchor.constraint(equalTo: unitHeaderView.leftAnchor).isActive = true
        unitHeaderViewController.view.rightAnchor.constraint(equalTo: unitHeaderView.rightAnchor).isActive = true

        unitHeaderViewController.unitTitleField?.stringValue = unit.title
    }
}
