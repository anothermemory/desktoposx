//
// Created by VIACHESLAV ENIS on 4/2/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Foundation
import AppKit

enum MemoriesListItemType: String {
    case header = "HeaderCell"
    case plain = "DataCell"
}

class MemoriesListItem {
    var name: String = ""
    var image: NSImage?
    var children: [MemoriesListItem] = []
    var isExpandable: Bool {
        return !children.isEmpty
    }
    var type: MemoriesListItemType
    var cellId: String {
        return self.type.rawValue
    }

    var memory: AMMemory?

    init(name: String, type: MemoriesListItemType) {
        self.name = name
        self.type = type
    }

    init(name: String, type: MemoriesListItemType, image: NSImage) {
        self.name = name
        self.type = type
        self.image = image
    }
}
