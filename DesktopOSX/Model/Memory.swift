//
// Created by VIACHESLAV ENIS on 3/12/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Foundation

class AMMemory: NSObject {
    var name: String
    var root: AMUnit?
    var storage: AMStorage?

    init(name: String) {
        self.name = name
    }
}
