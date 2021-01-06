import XCTest

class ValidPasswordsCounterTest: XCTestCase {

    private let counter = ValidPasswordsCounter()
    private let raw = PasswordsAndPoliciesRawInput.example
    
    func testCountsValidPasswordsWithCharacterCountPolicy() {

        let passwordsAndPolicies = Day2RawInputParser.parse(raw: raw, policyFactory: CharacterCountPolicyFactory())
        let count = counter.numberOfValidPasswords(passwordsAndPolicies)
        
        XCTAssertEqual(count, 2)
    }
    
    func testCountsValidPasswordsWithCharacterPositionPolicy() {

        let passwordsAndPolicies = Day2RawInputParser.parse(raw: raw, policyFactory: CharacterPositionPolicyFactory())
        let count = counter.numberOfValidPasswords(passwordsAndPolicies)
        
        XCTAssertEqual(count, 1)
    }
}
