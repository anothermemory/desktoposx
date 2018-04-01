//
// Created by VIACHESLAV ENIS on 4/1/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import ReSwift

let loggingMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            print(action)
            return next(action)
        }
    }
}
