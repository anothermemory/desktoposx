//
// Created by VIACHESLAV ENIS on 3/5/18.
// Copyright (c) 2018 Another Memory. All rights reserved.
//

import Quick
import Nimble

@testable import DesktopOSX

class MyDummyEnumSpec: QuickSpec {
    override func spec() {
        it("is simple") {
            expect(MyDummyEnum.First).to(equal(MyDummyEnum.First))
        }

        describe("MyDummyEnum") {
            describe("its First") {
                it("is easy to use") {
                    expect(MyDummyEnum.First).to(equal(MyDummyEnum.First))
                    expect(MyDummyEnum.First).toNot(equal(MyDummyEnum.First))
                }
            }
        }
    }
}
