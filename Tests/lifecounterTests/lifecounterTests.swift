import XCTest
@testable import lifecounter

final class lifecounterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(lifecounter().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
