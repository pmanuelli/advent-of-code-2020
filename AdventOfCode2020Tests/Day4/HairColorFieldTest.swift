import XCTest

class HairColorFieldTest: XCTestCase {

    private let field = HairColorField()
    
    func testValidatesValueWithNumeralAndSixDecimalOrExadecimalNumbers() {
        
        XCTAssertTrue(field.isValidValue("#123456"))
        XCTAssertTrue(field.isValidValue("#ABCDEF"))
        XCTAssertTrue(field.isValidValue("#CAFE08"))
        XCTAssertTrue(field.isValidValue("#1caca9"))
        XCTAssertFalse(field.isValidValue("#1XXXX9"))
        XCTAssertFalse(field.isValidValue("#1234567"))
        XCTAssertFalse(field.isValidValue("#12345"))
        XCTAssertFalse(field.isValidValue("123456"))
        XCTAssertFalse(field.isValidValue("ABCD6"))
    }
}
