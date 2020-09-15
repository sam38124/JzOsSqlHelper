import XCTest
@testable import JzOsSqlHelper

final class JzOsSqlHelperTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        JzOsSqlHelper().create()
        XCTAssertEqual(JzOsSqlHelper().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
