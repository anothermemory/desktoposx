//
//  AMUnitTextMarkdownView.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 4/3/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Cocoa

class AMUnitTextMarkdownView: NSView {
    @IBOutlet weak var titleField: NSTextField!
    
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
