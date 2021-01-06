import XCTest

class CharacterCountPolicyTest: XCTestCase {

    func testValidatesPasswords() {
                
        let policy = CharacterCountPolicy(minCount: 2, maxCount: 3, character: "a")
        
        XCTAssertFalse(policy.validates(Password(raw: "bbb")))
        XCTAssertFalse(policy.validates(Password(raw: "zzaz")))
        XCTAssertFalse(policy.validates(Password(raw: "azzaaaz")))
        XCTAssertTrue(policy.validates(Password(raw: "azzazaz")))
    }
}
