import XCTest

class Day8RawInputParserTest: XCTestCase {

    func testParsesRawInput() {
        
        let raw =
            """
            nop +0
            acc +1
            jmp -4
            """
        
        let program = Day8RawInputParser.parse(raw: raw)
        
        XCTAssertEqual(program[0] as? NoOperationInstruction, NoOperationInstruction())
        XCTAssertEqual(program[1] as? AccumulateInstruction, AccumulateInstruction(argument: 1))
        XCTAssertEqual(program[2] as? JumpInstruction, JumpInstruction(argument: -4))
    }
}
