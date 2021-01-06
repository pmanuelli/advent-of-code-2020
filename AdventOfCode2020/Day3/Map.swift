struct Map {
    
    let patternHeight: Int
    let patternWidth: Int
    let patternPositionsWithTree: Set<Position>
        
    func numberOfTrees(in slope: Slope) -> Int {
        
        return slope
            .generatePositions(mapHeight: patternHeight)
            .filter { positionHasATree($0) }
            .count
    }
    
    private func positionHasATree(_ position: Position) -> Bool {
        patternPositionsWithTree.contains(convertPositionToPatternPosition(position))
    }
    
    private func convertPositionToPatternPosition(_ position: Position) -> Position {
        return Position(row: position.row, column: position.column % patternWidth)
    }
}
