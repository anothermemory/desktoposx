//
// Created by VIACHESLAV ENIS on 3/18/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

//import Foundation
//import ReactorKit
//import RxSwift
//
//final class AppReactor: Reactor {
//    enum Action {
//        case appStartup
//    }
//
//    enum Mutation {
//        case setMemories([AMMemory])
//    }
//
//    struct State {
//        var memories: [AMMemory] = []
//    }
//
//    let initialState = State(memories: createDummyMemories())
//
//    func mutate(action: Action) -> Observable<Mutation> {
//        fatalError("mutate(action:) has not been implemented")
//    }
//
//    func reduce(state: State, mutation: Mutation) -> State {
//        fatalError("reduce(state:mutation:) has not been implemented")
//    }
//}
//
//func createDummyMemories() -> [AMMemory] {
//    var memories: [AMMemory] = []
//    let personalMemory = AMMemory(name: "Personal")
//    personalMemory.storage = AMStorageDirectory(rootDir: "/memories/personal")
//
//    let u = AMUnit(uid: UUID().uuidString, title: "My Unit", created: Date(), updated: Date())
//    let utp = AMUnitTextPlain(uid: UUID().uuidString, title: "My Plain Text", created: Date(), updated: Date(), data: "Some text data")
//    let utm = AMUnitTextMarkdown(uid: UUID().uuidString, title: "My Markdown Text", created: Date(), updated: Date(), data: "Some markdown data")
//    let utc = AMUnitTextCode(uid: UUID().uuidString, title: "My Code", created: Date(), updated: Date(), data: "dummy code", language: "PHP")
//
//    let ti1 = AMUnitTodoItem(data: "Item 1", done: false)
//    let ti2 = AMUnitTodoItem(data: "Item 2", done: true)
//    let ut = AMUnitTodo(uid: UUID().uuidString, title: "My Code", created: Date(), updated: Date(), items: [ti1, ti2])
//    personalMemory.root = AMUnitList(uid: UUID().uuidString, title: "My Work Unit", created: Date(), updated: Date(), items: [u, utp, utm, utc, ut])
//
//    memories.append(personalMemory)
//
//    let workMemory = AMMemory(name: "Work")
//    workMemory.storage = AMStorageDirectory(rootDir: "/memories/work")
//    workMemory.root = AMUnit(uid: UUID().uuidString, title: "My Work Unit", created: Date(), updated: Date())
//    memories.append(workMemory)
//    return memories
//}
