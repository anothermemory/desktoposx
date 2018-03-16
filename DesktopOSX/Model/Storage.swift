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

class AMStorage {
    var type: AMStorageType {
        return .unsupported
    }
}

class AMStorageDirectory {
    var rootDir: String

    var type: AMStorageType {
        return .directory
    }

    init(rootDir: String) {
        self.rootDir = rootDir
    }
}

class AMStorageDirectoryInMemory {
    var type: AMStorageType {
        return .directoryInMemory
    }
}
