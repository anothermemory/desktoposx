//
// Created by VIACHESLAV ENIS on 3/15/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Quick
import Nimble

@testable import DesktopOSX

let unitExample = "unit"
let unitTextPlainExample = "unitTextPlain"

class UnitSharedExamplesConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration!) {
        sharedExamples(unitExample) { (sharedExampleContext: @escaping SharedExampleContext) in
            it("has common unit properties") {
                let unit: AMUnit! = sharedExampleContext()["unit"] as? AMUnit

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

        sharedExamples(unitTextPlainExample) { (sharedExampleContext: @escaping SharedExampleContext) in
            it("can store textual data") {
                let unit: AMUnitTextPlain! = sharedExampleContext()["unit"] as? AMUnitTextPlain

                unit.data = "test"
                expect(unit.data) == "test"
            }
        }
    }
}

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

            itBehavesLike(unitExample) {
                ["unit": unit]
            }
        }

        describe("a plain text unit") {
            var unit: AMUnitTextPlain!
            beforeEach {
                unit = AMUnitTextPlain(
                        uid: "123",
                        title: "MyUnit",
                        created: Date(timeIntervalSince1970: TimeInterval(1)),
                        updated: Date(timeIntervalSince1970: TimeInterval(2)),
                        data: "data"
                        )
            }

            it("has type 'textPlain'") {
                expect(unit.type).to(equal(AMUnitType.textPlain))
            }

            itBehavesLike(unitExample) {["unit": unit]}
            itBehavesLike(unitTextPlainExample) {["unit": unit]}
        }

        describe("a markdown text unit") {
            var unit: AMUnitTextMarkdown!
            beforeEach {
                unit = AMUnitTextMarkdown(
                        uid: "123",
                        title: "MyUnit",
                        created: Date(timeIntervalSince1970: TimeInterval(1)),
                        updated: Date(timeIntervalSince1970: TimeInterval(2)),
                        data: "data"
                        )
            }

            it("has type 'textMarkdown'") {
                expect(unit.type).to(equal(AMUnitType.textMarkdown))
            }

            itBehavesLike(unitExample) {["unit": unit]}
            itBehavesLike(unitTextPlainExample) {["unit": unit]}
        }

        describe("a code text unit") {
            var unit: AMUnitTextCode!
            beforeEach {
                unit = AMUnitTextCode(
                        uid: "123",
                        title: "MyUnit",
                        created: Date(timeIntervalSince1970: TimeInterval(1)),
                        updated: Date(timeIntervalSince1970: TimeInterval(2)),
                        data: "data",
                        language: "PHP"
                        )
            }

            it("has type 'textCode'") {
                expect(unit.type).to(equal(AMUnitType.textCode))
            }

            it("can store language") {
                unit.language = "Java"
                expect(unit.language) == "Java"
            }

            itBehavesLike(unitExample) {["unit": unit]}
            itBehavesLike(unitTextPlainExample) {["unit": unit]}
        }
    }
}
