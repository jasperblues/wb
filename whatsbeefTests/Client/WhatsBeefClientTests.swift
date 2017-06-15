////////////////////////////////////////////////////////////////////////////////
//
//  Freelancer
//  Copyright 2017 Freelancer
//  All Rights Reserved.
//
//  NOTICE: Prepared by Jasper Blues, on behalf of Freelancer
//
////////////////////////////////////////////////////////////////////////////////

import Foundation
import XCTest
@testable import whatsbeef

class WhatsBeefClientTests : XCTestCase {

    let client = whatsbeef.ApplicationAssembly().whatsBeefClient()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLoad() {
        let exp = expectation(description: "\(#function)\(#line)")

        client.load(start: 0).then {(items) in
            exp.fulfill()
        }.catch {(error) in
            XCTFail("Should have retrieved items.")
        }

        waitForExpectations(timeout: 40, handler: nil)
    }



}
