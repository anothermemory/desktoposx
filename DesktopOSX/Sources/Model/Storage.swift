//
// Created by VIACHESLAV ENIS on 3/16/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Foundation

enum AMStorageType {
    case unsupported
    case directory
    case directoryInMemory
}

class AMStorage: NSObject {
    var type: AMStorageType {
        return .unsupported
    }
}

class AMStorageDirectory: AMStorage {
    var rootDir: String

    override var type: AMStorageType {
        return .directory
    }

    init(rootDir: String) {
        self.rootDir = rootDir
    }
}

class AMStorageDirectoryInMemory: AMStorage {
    override var type: AMStorageType {
        return .directoryInMemory
    }
}
