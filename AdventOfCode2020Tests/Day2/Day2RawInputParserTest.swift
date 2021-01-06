import XCTest

class RawInputParserTest: XCTestCase {

    private let raw =
        """
        1-3 a: abcde
        1-3 b: cdefg
        2-9 c: ccccccccc
        """
    
    private let expectedPasswords = [Password(raw: "abcde"),
                                     Password(raw: "cdefg"),
                                     Password(raw: "ccccccccc")]

    func testParsesRawInputWithCharacterCountPolicy() {
        
        let parsedInput = Day2RawInputParser.parse(raw: raw, policyFactory: CharacterCountPolicyFactory())
        
        let expectedPolicies = [CharacterCountPolicy(minCount: 1, maxCount: 3, character: "a"),
                                CharacterCountPolicy(minCount: 1, maxCount: 3, character: "b"),
                                CharacterCountPolicy(minCount: 2, maxCount: 9, character: "c")]
        
        let parsedPolicies = parsedInput.compactMap { $0.0 as? CharacterCountPolicy }
        
        XCTAssertEqual(parsedPolicies, expectedPolicies)
        XCTAssertEqual(parsedInput.map { $0.1 }, expectedPasswords)
    }
    
    func testParsesRawInputWithCharacterPositionPolicy() {
        
        let parsedInput = Day2RawInputParser.parse(raw: raw, policyFactory: CharacterPositionPolicyFactory())
        
        let expectedPolicies = [CharacterPositionPolicy(firstPosition: 1, secondPosition: 3, character: "a"),
                                CharacterPositionPolicy(firstPosition: 1, secondPosition: 3, character: "b"),
                                CharacterPositionPolicy(firstPosition: 2, secondPosition: 9, character: "c")]
        
        let parsedPolicies = parsedInput.compactMap { $0.0 as? CharacterPositionPolicy }
        
        XCTAssertEqual(parsedPolicies, expectedPolicies)
        XCTAssertEqual(parsedInput.map { $0.1 }, expectedPasswords)
    }
}
