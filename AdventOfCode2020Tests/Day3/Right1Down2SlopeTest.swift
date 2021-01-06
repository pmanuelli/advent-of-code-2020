import XCTest

class Right1Down2SlopeTest: XCTestCase {

    func testGeneratesSlopePositions() {

        let slope = Right1Down2Slope()
        
        let positions = slope.generatePositions(mapHeight: 6)
        
        let expectedPositions = [Position(row: 0, column: 0),
                                 Position(row: 2, column: 1),
                                 Position(row: 4, column: 2)]
        
        XCTAssertEqual(positions, expectedPositions)
    }
    
    func testGeneratesSlopePositionsWithEvenHeight() {

        let slope = Right1Down2Slope()
        
        let positions = slope.generatePositions(mapHeight: 7)
        
        let expectedPositions = [Position(row: 0, column: 0),
                                 Position(row: 2, column: 1),
                                 Position(row: 4, column: 2),
                                 Position(row: 6, column: 3)]
        
        XCTAssertEqual(positions, expectedPositions)
    }
}
