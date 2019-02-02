//
//  MainTableViewCellEntityTests.swift
//  ReminderiOSTests
//
//  Created by Shinji Muto on 2019/01/14.
//  Copyright © 2019 subta90. All rights reserved.
//

import Nimble
import Quick
@testable import ReminderiOS

class MainTableViewCellEntityTests: QuickSpec {
    
    override func spec() {
        describe("setMessage") {
            it("messageの初期値は空文字") {
                let entity = MainTableViewCellEntity()
                expect(entity.message).to(beEmpty())
            }
        }
    }
}
