import XCTest

class CharacterPositionPolicyTest: XCTestCase {

    func testValidatesPasswords() {
                
        let policy = CharacterPositionPolicy(firstPosition: 1, secondPosition: 3, character: "a")
        
        XCTAssertFalse(policy.validates(Password(raw: "axa")))
        XCTAssertFalse(policy.validates(Password(raw: "xxx")))
        XCTAssertTrue(policy.validates(Password(raw: "axx")))
        XCTAssertTrue(policy.validates(Password(raw: "xxa")))

        XCTAssertFalse(policy.validates(Password(raw: "ax")))
        XCTAssertFalse(policy.validates(Password(raw: "a")))
        XCTAssertFalse(policy.validates(Password(raw: "x")))
        
        XCTAssertTrue(policy.validates(Password(raw: "axxx")))
        XCTAssertTrue(policy.validates(Password(raw: "xxax")))

        XCTAssertFalse(policy.validates(Password(raw: "axax")))
        XCTAssertFalse(policy.validates(Password(raw: "xxxx")))
    }
}

