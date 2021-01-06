import XCTest

class QuestionAnswersCounterTest: XCTestCase {

    let counter = QuestionAnswersCounter()
    
    func testCountsDifferentAnswersInAGroup() {
        
        XCTAssertEqual(counter.numberOfQuestionsWithAtLeastOneAnswerInGroup(["abcde"]), 5)
        XCTAssertEqual(counter.numberOfQuestionsWithAtLeastOneAnswerInGroup(["aabbc"]), 3)
        XCTAssertEqual(counter.numberOfQuestionsWithAtLeastOneAnswerInGroup(["aabbc", "a", "z"]), 4)
        XCTAssertEqual(counter.numberOfQuestionsWithAtLeastOneAnswerInGroup(["a", "a", "a", "b"]), 2)
    }
    
    func testCountsDifferentAnswersInGroups() {
        
        let groupsAnswers: [[String]] = [["abcde"],
                                        ["aabbc"],
                                        ["aabbc", "a", "z"],
                                        ["a", "a", "a", "b"]]
        
        XCTAssertEqual(counter.numberOfQuestionsWithAtLeastOneAnswerInGroups(groupsAnswers), [5, 3, 4, 2])
    }
    
    func testCountsNumberOfQuestionsThatAllMembersHaveAnswerInAGroup() {
        
        XCTAssertEqual(counter.numberOfQuestionsThatAllAnsweredInGroup(["abcde"]), 5)
        XCTAssertEqual(counter.numberOfQuestionsThatAllAnsweredInGroup(["abc"]), 3)
        XCTAssertEqual(counter.numberOfQuestionsThatAllAnsweredInGroup(["abc", "a", "az"]), 1)
        XCTAssertEqual(counter.numberOfQuestionsThatAllAnsweredInGroup(["a", "a", "a", "b"]), 0)
        XCTAssertEqual(counter.numberOfQuestionsThatAllAnsweredInGroup(["ab", "ba", "xbza", "bxxa"]), 2)
    }
        
    func testCountsExampleData() {
        
        let groupsAnswers = Day6RawInputParser.parse(raw: GroupsAnswersRawInput.example)
        
        XCTAssertEqual(counter.numberOfQuestionsWithAtLeastOneAnswerInGroups(groupsAnswers), [3, 3, 3, 1, 1])
    }
}
