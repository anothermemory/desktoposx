//
// Created by VIACHESLAV ENIS on 3/12/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import ReSwift

func memoriesReducer(action: Action, state: MemoriesState?) -> MemoriesState {
    var state = state ?? MemoriesState()

    switch action {
    case _ as ReSwiftInit:
        break
    case let action as SetMemoriesAction:
        state.memories = action.memories
    default:
        break
    }

    return state
}