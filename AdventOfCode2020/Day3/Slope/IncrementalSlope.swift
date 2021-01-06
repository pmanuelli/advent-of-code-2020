import Foundation

struct IncrementalSlope: Slope {
    
    private let rowIncrement: Int
    private let columnIncrement: Int
    
    init(rowIncrement: Int, columnIncrement: Int) {
        self.rowIncrement = rowIncrement
        self.columnIncrement = columnIncrement
    }
    
    func generatePositions(mapHeight: Int) -> [Position] {
        let upperBound = Int(ceil(Double(mapHeight) / Double(rowIncrement)))
        
        return (0 ..< upperBound)
            .map { Position(row: $0 * rowIncrement, column: $0 * columnIncrement) }
    }
}

struct Right1Down1Slope: Slope {
    
    private let slope = IncrementalSlope(rowIncrement: 1, columnIncrement: 1)
    
    func generatePositions(mapHeight: Int) -> [Position] {
        slope.generatePositions(mapHeight: mapHeight)
    }
}

struct Right3Down1Slope: Slope {
    
    private let slope = IncrementalSlope(rowIncrement: 1, columnIncrement: 3)
    
    func generatePositions(mapHeight: Int) -> [Position] {
        slope.generatePositions(mapHeight: mapHeight)
    }
}

struct Right5Down1Slope: Slope {
    
    private let slope = IncrementalSlope(rowIncrement: 1, columnIncrement: 5)
    
    func generatePositions(mapHeight: Int) -> [Position] {
        slope.generatePositions(mapHeight: mapHeight)
    }
}

struct Right7Down1Slope: Slope {
    
    private let slope = IncrementalSlope(rowIncrement: 1, columnIncrement: 7)
    
    func generatePositions(mapHeight: Int) -> [Position] {
        slope.generatePositions(mapHeight: mapHeight)
    }
}

struct Right1Down2Slope: Slope {
    
    private let slope = IncrementalSlope(rowIncrement: 2, columnIncrement: 1)
    
    func generatePositions(mapHeight: Int) -> [Position] {
        slope.generatePositions(mapHeight: mapHeight)
    }
}
