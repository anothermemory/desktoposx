//
// Created by VIACHESLAV ENIS on 3/15/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Foundation

enum AMUnitType {
    case unit
    case list
    case todo
    case textPlain
    case textMarkdown
    case textCode
}

class AMUnit {
    var type: AMUnitType {
        return .unit
    }
    var uid: String
    var title: String
    var created: Date
    var updated: Date

    init(uid: String, title: String, created: Date, updated: Date) {
        self.uid = uid
        self.title = title
        self.created = created
        self.updated = updated
    }
}

class AMUnitTextPlain: AMUnit {
    override var type: AMUnitType {
        return .textPlain
    }
    public var data: String

    init(uid: String, title: String, created: Date, updated: Date, data: String) {
        self.data = data
        super.init(uid: uid, title: title, created: created, updated: updated)
    }
}

class AMUnitTextMarkdown: AMUnitTextPlain {
    override var type: AMUnitType {
        return .textMarkdown
    }
}

class AMUnitTextCode: AMUnitTextPlain {
    override var type: AMUnitType {
        return .textCode
    }
    var language: String

    init(uid: String, title: String, created: Date, updated: Date, data: String, language: String) {
        self.language = language
        super.init(uid: uid, title: title, created: created, updated: updated, data: data)
    }
}

struct AMUnitTodoItem {
    var data: String
    var done: Bool = false
}

class AMUnitTodo: AMUnit {
    override var type: AMUnitType {
        return .todo
    }
    var items: [AMUnitTodoItem] = []

    init(uid: String, title: String, created: Date, updated: Date, items: [AMUnitTodoItem]) {
        self.items = items
        super.init(uid: uid, title: title, created: created, updated: updated)
    }
}

class AMUnitList: AMUnit {
    override var type: AMUnitType {
        return .list
    }

    var items: [AMUnit] = []

    init(uid: String, title: String, created: Date, updated: Date, items: [AMUnit]) {
        self.items = items
        super.init(uid: uid, title: title, created: created, updated: updated)
    }
}
