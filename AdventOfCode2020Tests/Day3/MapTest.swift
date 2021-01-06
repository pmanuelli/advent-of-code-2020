import XCTest

class MapTest: XCTestCase {

    func testGetsNumberOfTreesInSlopeThatFitsPattern() {
        
        let raw =
            """
            .........
            ...#.....
            ......#..
            """
        
        let parsedInput = Day3RawInputParser.parse(raw: raw)
        let map = Map(patternHeight: parsedInput.height,
                      patternWidth: parsedInput.width,
                      patternPositionsWithTree: parsedInput.positionsWithTree)
        
        let slope = MockSlope(positionsToReturn: [Position(row: 0, column: 0),
                                                  Position(row: 1, column: 3),
                                                  Position(row: 2, column: 5),
                                                  Position(row: 2, column: 6)])
        
        XCTAssertEqual(map.numberOfTrees(in: slope), 2)
    }
    
    func testGetsNumberOfTreesInSlopeThatDoesNotFitInPattern() {
        
        let raw =
            """
            .......
            ...#...
            .......
            ..#....
            .....#.
            .#.....
            """
        
        let parsedInput = Day3RawInputParser.parse(raw: raw)
        let map = Map(patternHeight: parsedInput.height,
                      patternWidth: parsedInput.width,
                      patternPositionsWithTree: parsedInput.positionsWithTree)
        
        let slope = MockSlope(positionsToReturn: [Position(row: 0, column: 0),
                                                  Position(row: 1, column: 3),
                                                  Position(row: 2, column: 2),
                                                  Position(row: 3, column: 9),
                                                  Position(row: 4, column: 12)])
                
        XCTAssertEqual(map.numberOfTrees(in: slope), 3)
    }
    
    func testGetsNumberOfTreesInExamplePattern() {
        
        let raw = MapPatternRawInput.example
        let parsedInput = Day3RawInputParser.parse(raw: raw)
        
        let map = Map(patternHeight: parsedInput.height,
                      patternWidth: parsedInput.width,
                      patternPositionsWithTree: parsedInput.positionsWithTree)
        
        XCTAssertEqual(map.numberOfTrees(in: Right3Down1Slope()), 7)
    }
}

struct MockSlope: Slope {
    
    let positionsToReturn: [Position]

    func generatePositions(mapHeight: Int) -> [Position] {
        return positionsToReturn
    }
}
