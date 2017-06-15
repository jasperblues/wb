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

class ResponseParserTests: XCTestCase {

    var response : String?

    override func setUp() {
        super.setUp()

        let fileURL = Bundle(for: ResponseParserTests.self).url(forResource: "SampleResponse", withExtension: "json")!
        response = try! String(contentsOf: fileURL)
        XCTAssertNotNil(response)
    }

    func testResponseParsing()
    {
        let responseParser = ResponseParser()
        let items = responseParser.parse(response: response!)
        XCTAssertNotNil(items)
        XCTAssertEqual(10, items.count)

        XCTAssertEqual("M", items[0].rating)
        XCTAssertEqual("7Mate", items[0].channel)
        XCTAssertEqual("Hardcore Pawn", items[0].name)
        XCTAssertEqual("8:30pm", items[0].startTime)
        XCTAssertEqual("9:30pm", items[0].endTime)


        XCTAssertEqual("PG", items[1].rating)
        XCTAssertEqual("7Mate", items[1].channel)
        XCTAssertEqual("American Pickers", items[1].name)
        XCTAssertEqual("9:30pm", items[1].startTime)
        XCTAssertEqual("11:30pm", items[1].endTime)

    }

}