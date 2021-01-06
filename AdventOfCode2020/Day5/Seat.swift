import Foundation

struct Seat {
    let row: Int
    let column: Int
    var id: Int { row * 8 + column }
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
    
    init(binarySpacePartition: String) throws {
        self.row = try Seat.getRow(from: binarySpacePartition.prefix(7))
        self.column = try Seat.getColumn(from: binarySpacePartition.suffix(3))
    }
    
    private static func getRow(from partition: Substring) throws -> Int  {
        try getValue(from: partition, lowerHalfCharacter: "F", upperHalfCharacter: "B", maxValue: 127)
    }
    
    private static func getColumn(from partition: Substring) throws -> Int  {
        try getValue(from: partition, lowerHalfCharacter: "L", upperHalfCharacter: "R", maxValue: 7)
    }
    
    private static func getValue(from partition: Substring,
                                  lowerHalfCharacter: Character,
                                  upperHalfCharacter: Character,
                                  maxValue: Int) throws -> Int  {
        
        var minValue = 0
        var maxValue = maxValue
        
        for character in partition {
            
            switch character {
            case lowerHalfCharacter:
                maxValue = minValue + Int(floor(Double(maxValue - minValue)/2.0))
            case upperHalfCharacter:
                minValue = minValue + Int(ceil(Double(maxValue - minValue)/2.0))
            default:
                throw SeatPartitionError.unexpectedElement
            }
        }
        
        return minValue
    }
}

extension Seat: Equatable { }

enum SeatPartitionError: Error {
    
    case unexpectedLength
    case unexpectedElement
}
