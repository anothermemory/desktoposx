//
//  AMUnitTextPlainView.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 4/2/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa

class AMUnitTextPlainView: NSView {
    @IBOutlet var titleField: NSTextField!
    @IBOutlet var createdField: NSTextField!
    @IBOutlet var updatedField: NSTextField!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        customSetup()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        customSetup()
    }
    
    func customSetup() {
        xibSetup()
    }
}
