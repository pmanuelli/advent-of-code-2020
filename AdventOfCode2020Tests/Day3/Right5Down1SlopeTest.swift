import XCTest

class Right5Down1SlopeTest: XCTestCase {

    func testGeneratesSlopePositions() {

        let slope = Right5Down1Slope()
        
        let positions = slope.generatePositions(mapHeight: 6)
        
        let expectedPositions = [Position(row: 0, column: 0),
                                 Position(row: 1, column: 5),
                                 Position(row: 2, column: 10),
                                 Position(row: 3, column: 15),
                                 Position(row: 4, column: 20),
                                 Position(row: 5, column: 25)]
        
        XCTAssertEqual(positions, expectedPositions)
    }

}
