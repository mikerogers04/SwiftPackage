import XCTest
@testable import TestPackage

final class TestPackageTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TestPackage().text, "Hello, World!")
        XCTAssertEqual(TestPackage().add, 4)
//        XCTAssertEqual(math().add(), 4)
    }
}
