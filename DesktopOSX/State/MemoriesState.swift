//
// Created by VIACHESLAV ENIS on 3/12/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

struct MemoriesState {
    var memories: [Memory] = []

    init() {
        memories.append(Memory(name: "Personal"))
        memories.append(Memory(name: "Work"))
    }
}
