//
// Created by VIACHESLAV ENIS on 3/11/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
            memoriesState: memoriesReducer(action: action, state: state?.memoriesState)
    )
}
