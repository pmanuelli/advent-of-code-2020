import XCTest

class Day3RawInputParserTest: XCTestCase {

    func testReturnsPositionsWithNumeralsInOneRow() {
        
        let parsedInput = Day3RawInputParser.parse(raw: ".##..#")
        let expectedPositions = [Position(row: 0, column: 1),
                                 Position(row: 0, column: 2),
                                 Position(row: 0, column: 5)]
        
        XCTAssertEqual(parsedInput.positionsWithTree, Set(expectedPositions))
    }
    
    func testReturnsPositionsWithNumeralsInMultipleRows() {
        
        let raw =
        """
        .##..#
        #....#
        """
        
        let parsedInput = Day3RawInputParser.parse(raw: raw)
        let expectedPositions = [Position(row: 0, column: 1),
                                 Position(row: 0, column: 2),
                                 Position(row: 0, column: 5),
                                 Position(row: 1, column: 0),
                                 Position(row: 1, column: 5)]
        
        XCTAssertEqual(parsedInput.positionsWithTree, Set(expectedPositions))
    }
    
    func testReturnsWidthAndHeightWithSingleRowInput() {
        
        let parsedInput = Day3RawInputParser.parse(raw: ".##..#")
        
        XCTAssertEqual(parsedInput.width, 6)
        XCTAssertEqual(parsedInput.height, 1)
    }
    
    func testReturnsWidthAndHeightWithMultiRowInput() {
        
        let raw =
        """
        .##..#
        #....#
        """
        
        let parsedInput = Day3RawInputParser.parse(raw: raw)
        
        XCTAssertEqual(parsedInput.width, 6)
        XCTAssertEqual(parsedInput.height, 2)
    }
}
