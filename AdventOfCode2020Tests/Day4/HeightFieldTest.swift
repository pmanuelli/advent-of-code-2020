import XCTest

class HeightFieldTest: XCTestCase {

    private let field = HeightField()
    
    func testValidatesHeightValuesInCentimeters() {
                
        XCTAssertFalse(field.isValidValue("149cm"))
        XCTAssertTrue(field.isValidValue("150cm"))
        XCTAssertTrue(field.isValidValue("193cm"))
        XCTAssertFalse(field.isValidValue("194cm"))
    }
    
    func testValidatesHeightValuesInInches() {
                
        XCTAssertFalse(field.isValidValue("58in"))
        XCTAssertTrue(field.isValidValue("59in"))
        XCTAssertTrue(field.isValidValue("76in"))
        XCTAssertFalse(field.isValidValue("77in"))
    }
    
    func testFailsIfHasNoUnit() {
    
        XCTAssertFalse(field.isValidValue("59"))
        XCTAssertFalse(field.isValidValue("150"))
    }
    
    func testFailsIfHasNoNumber() {
    
        XCTAssertFalse(field.isValidValue("in"))
        XCTAssertFalse(field.isValidValue("cm"))
    }
    
    func testFailsIfNotValidUnit() {
    
        XCTAssertFalse(field.isValidValue("160ccm"))
        XCTAssertFalse(field.isValidValue("100km"))
    }
}
