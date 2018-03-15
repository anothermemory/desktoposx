//
// Created by VIACHESLAV ENIS on 3/15/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Quick
import Nimble

@testable import DesktopOSX

class UnitSpec: QuickSpec {
    override func spec() {
        describe("a unit") {
            var unit: AMUnit!
            beforeEach {
                unit = AMUnit(
                        uid: "123",
                        title: "MyUnit",
                        created: Date(timeIntervalSince1970: TimeInterval(1)),
                        updated: Date(timeIntervalSince1970: TimeInterval(2)))
            }

            it("has type 'unit'") {
                expect(unit.type).to(equal(AMUnitType.unit))
            }

            it("can have properties changed") {
                unit.uid = "789"
                unit.title = "Updated"
                let newCreatedDate = Date(timeIntervalSince1970: TimeInterval(3))
                unit.created = newCreatedDate
                let newUpdatedDate = Date(timeIntervalSince1970: TimeInterval(4))
                unit.updated = newUpdatedDate

                expect(unit.uid) == "789"
                expect(unit.title) == "Updated"
                expect(unit.created) == newCreatedDate
                expect(unit.updated) == newUpdatedDate
            }
        }
    }
}
