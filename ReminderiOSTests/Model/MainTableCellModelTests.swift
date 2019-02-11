//
//  MainTableViewCellEntityTests.swift
//  ReminderiOSTests
//
//  Created by subta on 2019/01/14.
//  Copyright © 2019 subta90. All rights reserved.
//

import Nimble
import Quick
@testable import ReminderiOS

class MainTableCellModelTests: QuickSpec {
    
    override func spec() {
        describe("setMessage") {
            it("messageの初期値は空文字") {
                let model = MainTableCellModel()
                expect(model.message).to(beEmpty())
            }
        }
    }
}
