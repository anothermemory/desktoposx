//
// Created by VIACHESLAV ENIS on 4/1/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Foundation
import ReSwift

func createAppStore() -> Store<AppState> {
    return Store<AppState>(reducer: appReducer, state: AppState(), middleware: [loggingMiddleware])
}

extension Store {
    func dispatchOnMain(_ action: Action) {
        DispatchQueue.main.async {
            self.dispatch(action)
        }
    }
}
