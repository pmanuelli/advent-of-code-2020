import XCTest

class ExpensesTest: XCTestCase {

    private let calculator = ExpensesCalculator()
    
    func testTwoExpensesReturnsZeroIfInputIsEmpty() {
        XCTAssertEqual(0, calculator.multiplyTwoExpensesThatSums2020(expenses: []))
    }

    func testTwoExpensesReturnsZeroIfInputHasOnlyOneValue() {
        XCTAssertEqual(0, calculator.multiplyTwoExpensesThatSums2020(expenses: [2020]))
    }
    
    func testTwoExpensesReturnsZeroIfNoTwoValuesSums2020() {
        XCTAssertEqual(0, calculator.multiplyTwoExpensesThatSums2020(expenses: [2020, 100, 300]))
    }
    
    func testReturnsMultiplicationOfTwoValuesThatSum2020() {
        
        XCTAssertEqual(2019, calculator.multiplyTwoExpensesThatSums2020(expenses: [2019, 1]))
        XCTAssertEqual(396000, calculator.multiplyTwoExpensesThatSums2020(expenses: [2001, 1800, 220]))
        
        let expenses = Day1RawInputParser.parse(ExpensesRawInput.example)
        XCTAssertEqual(514579, calculator.multiplyTwoExpensesThatSums2020(expenses: expenses))
    }
    
    func testThreeExpensesReturnsZeroIfInputHasLessThatTwoValues() {
        XCTAssertEqual(0, calculator.multiplyThreeExpensesThatSums2020(expenses: [2020, 2020]))
    }
    
    func testThreeExpensesReturnsZeroIfNoThreeValuesSums2020() {
        XCTAssertEqual(0, calculator.multiplyThreeExpensesThatSums2020(expenses: [2020, 100, 300, 3782]))
    }
    
    func testReturnsMultiplicationOfThreeValuesThatSum2020() {
        
        XCTAssertEqual(2018, calculator.multiplyThreeExpensesThatSums2020(expenses: [2018, 1, 1]))
        XCTAssertEqual(784800, calculator.multiplyThreeExpensesThatSums2020(expenses: [2001, 1800, 218, 2]))

        let expenses = Day1RawInputParser.parse(ExpensesRawInput.example)
        XCTAssertEqual(241861950, calculator.multiplyThreeExpensesThatSums2020(expenses: expenses))
    }
}
