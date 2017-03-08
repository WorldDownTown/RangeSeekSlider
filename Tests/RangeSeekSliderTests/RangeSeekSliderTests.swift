import XCTest
@testable import RangeSeekSlider

class RangeSeekSliderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(RangeSeekSlider().text, "Hello, World!")
    }


    static var allTests : [(String, (RangeSeekSliderTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
