import XCTest

class SeatTest: XCTestCase {

    private var seat: Seat!
    
    func testCalculatesRowFromBinarySpacePartition() throws {
    
        let partitions = ["FFFFFFFLLL", "BBBBBBBLLL", "FBBBBBBLLL", "BFFFFFFLLL", "FBFBBFFLLL"]
        let expectedRows = [0, 127, 63, 64, 44]
        
        for index in partitions.indices {
            
            let partition = partitions[index]
            let expectedRow = expectedRows[index]
            let seat = try Seat(binarySpacePartition: partition)
            
            XCTAssertEqual(seat.row, expectedRow)
        }
    }
    
    func testCalculatesColumnFromBinarySpacePartition() throws {
    
        let partitions = ["FFFFFFFLLL", "FFFFFFFRRR", "FFFFFFFLRR", "FFFFFFFRLL", "FFFFFFFRLR"]
        let expectedRows = [0, 7, 3, 4, 5]
        
        for index in partitions.indices {
            
            let partition = partitions[index]
            let expectedRow = expectedRows[index]
            let seat = try Seat(binarySpacePartition: partition)
            
            XCTAssertEqual(seat.column, expectedRow)
        }
    }
    
    func testCreatesSeatFromBinarySpacePartition() throws {
        
        seat = try Seat(binarySpacePartition: BinarySpacePartitionRawInput.example)
        
        XCTAssertEqual(Seat(row: 44, column: 5), seat)
    }
    
    func testCreatesCorrectSeatId() throws {
        
        let seats = [Seat(row: 0, column: 0),
                     Seat(row: 0, column: 7),
                     Seat(row: 1, column: 0),
                     Seat(row: 1, column: 7),
                     Seat(row: 75, column: 4),
                     try Seat(binarySpacePartition: BinarySpacePartitionRawInput.example)]
        
        let expectedIds = [0, 7, 8, 15, 604, 357]
        
        for index in seats.indices {
            XCTAssertEqual(seats[index].id, expectedIds[index])
        }
    }
}
