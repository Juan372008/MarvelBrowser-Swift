import XCTest

class HasQueryTests : XCTestCase {

    func testShouldMatchURLContainingMatchingKeyAndValueInFirstPosition() {
        let url = URL(string: "http://dummy.com/dummy?key1=value1")!

        XCTAssertTrue(url.hasQuery(name: "key1", value: "value1"))
    }

    func testShouldMatchURLContainingMatchingKeyAndValueInSecondPosition() {
        let url = URL(string: "http://dummy.com/dummy?key1=value1&key2=value2")!

        XCTAssertTrue(url.hasQuery(name: "key2", value: "value2"))
    }

    func testShouldNotMatchURLNotContainingMatchingKey() {
        let url = URL(string: "http://dummy.com/dummy?WRONGKEY=value1")!

        XCTAssertFalse(url.hasQuery(name: "key1", value: "value1"))
    }

    func testShouldNotMatchURLContainingMatchingKeyButWrongValue() {
        let url = URL(string: "http://dummy.com/dummy?key1=WRONGVALUE")!

        XCTAssertFalse(url.hasQuery(name: "key1", value: "value1"))
    }

}
