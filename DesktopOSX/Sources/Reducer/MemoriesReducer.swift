//
// Created by VIACHESLAV ENIS on 4/1/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Foundation
import ReSwift

func fillDummyMemories() -> [AMMemory] {
    var memories: [AMMemory] = []
    let personalMemory = AMMemory(name: "Personal")
    personalMemory.storage = AMStorageDirectory(rootDir: "/memories/personal")

    let u = AMUnit(uid: UUID().uuidString, title: "My Unit", created: Date(), updated: Date())
    let utp = AMUnitTextPlain(uid: UUID().uuidString, title: "My Plain Text", created: Date(), updated: Date(), data: "Some text data")
    let utm = AMUnitTextMarkdown(uid: UUID().uuidString, title: "My Markdown Text", created: Date(), updated: Date(), data: "Some markdown data")
    let utc = AMUnitTextCode(uid: UUID().uuidString, title: "My Code", created: Date(), updated: Date(), data: "dummy code", language: "PHP")

    let ti1 = AMUnitTodoItem(data: "Item 1", done: false)
    let ti2 = AMUnitTodoItem(data: "Item 2", done: true)
    let ut = AMUnitTodo(uid: UUID().uuidString, title: "My Code", created: Date(), updated: Date(), items: [ti1, ti2])
    personalMemory.root = AMUnitList(uid: UUID().uuidString, title: "My Work Unit", created: Date(), updated: Date(), items: [u, utp, utm, utc, ut])

    memories.append(personalMemory)

    let workMemory = AMMemory(name: "Work")
    workMemory.storage = AMStorageDirectory(rootDir: "/memories/work")
    workMemory.root = AMUnit(uid: UUID().uuidString, title: "My Work Unit", created: Date(), updated: Date())
    memories.append(workMemory)
    return memories
}

func memoriesReducer(action: Action, state: MemoriesState?) -> MemoriesState {
    var state = state ?? MemoriesState()

    switch action {
    case _ as ReSwiftInit:
        break
    case _ as AppStarted:
        state.memories = fillDummyMemories()
    default:
        break
    }

    return state
}
