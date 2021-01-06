import XCTest

class Day6RawInputParserTest: XCTestCase {

    func testParsesRawInput() {
        
        let raw =
            """
            abc
            abc
            a

            bc

            ab
            a
            z
            """
        
        let parsedInput = Day6RawInputParser.parse(raw: raw)
        
        XCTAssertEqual(parsedInput, [["abc", "abc", "a"],
                                     ["bc"],
                                     ["ab", "a", "z"]])
    }
}
