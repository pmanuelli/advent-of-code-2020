struct Day3RawInputParser {
    
    struct ParsedInput {
        let width: Int
        let height: Int
        let positionsWithTree: Set<Position>
    }
    
    static func parse(raw: String) -> ParsedInput {
        
        let width = getWidth(raw: raw)
        let height = getHeight(raw: raw)
        
        let positions = raw
            .filter { !$0.isNewline }
            .enumerated()
            .compactMap { return $0.element == "#" ? $0.offset : nil }
            .map { Position(row: $0 / width, column: $0 % width) }
        
        return ParsedInput(width: width,
                           height: height,
                           positionsWithTree: Set(positions))
    }
    
    private static func getWidth(raw: String) -> Int {
        let endOfLineIndex = raw.firstIndex(where: { $0.isNewline }) ?? raw.endIndex
        return endOfLineIndex.utf16Offset(in: raw)
    }
    
    private static func getHeight(raw: String) -> Int {
        return raw.filter { $0.isNewline }.count + 1
    }
}

struct Position {
    let row: Int
    let column: Int
}

extension Position: Hashable, Equatable { }
