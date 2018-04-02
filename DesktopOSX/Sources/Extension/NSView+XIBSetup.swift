//
//  NSView+XIBSetup.swift
//  DesktopOSX
//
//  Created by VIACHESLAV ENIS on 4/3/18.
//  Copyright © 2018 Another Memory. All rights reserved.
//

import Foundation
import AppKit

extension NSView {
    func xibSetup() {
        let view = loadFromNib()
        addSubview(view)
        stretch(view: view)
    }
    
    func loadFromNib<T: NSView>() -> T {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = NSNib(nibNamed: NSNib.Name(rawValue: nibName), bundle: bundle)
        
        var content:NSArray? = NSArray()
        
        guard (nib?.instantiate(withOwner: self, topLevelObjects: &content)) != nil else {
            fatalError("Error loading nib with name \(nibName)")
        }
        
        for obj in content! {
            if let view = obj as? NSView {
                return view as! T
            }
        }
        fatalError("Error loading view from nib with name \(nibName)")
    }
    
    func stretch(view: NSView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
