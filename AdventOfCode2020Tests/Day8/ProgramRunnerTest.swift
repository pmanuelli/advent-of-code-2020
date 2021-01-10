import XCTest

class ProgramRunnerTest: XCTestCase {

    private let runner = ProgramRunner()
    
    func testExecutesInstructionsFollowingInstructionPointer() {
        
        let program = [aInstruction(returning: ProgramState(instructionPointer: 2, accumulator: 0)),
                       aInstruction(returning: ProgramState(instructionPointer: 0, accumulator: 0)),
                       aInstruction(returning: ProgramState(instructionPointer: 3, accumulator: 1024))]
        
        let _ = runner.run(program: program)
        
        XCTAssertEqual(program[0].executeTimesCalled, 1)
        XCTAssertEqual(program[1].executeTimesCalled, 0)
        XCTAssertEqual(program[2].executeTimesCalled, 1)
    }
    
    func testReturnsAccumulatorReturnedByLastExecutedInstruction() {
        
        let expectedAccumulator = 1024
        let program = [aInstruction(returning: ProgramState(instructionPointer: 2, accumulator: 0)),
                       aInstruction(returning: ProgramState(instructionPointer: 0, accumulator: 0)),
                       aInstruction(returning: ProgramState(instructionPointer: 3, accumulator: expectedAccumulator))]
        
        let accumulator = runner.run(program: program)
        
        XCTAssertEqual(accumulator, expectedAccumulator)
    }
    
    func testUpdatesState() {
        
        let initialState = ProgramState(instructionPointer: 0, accumulator: 0)
        
        let states = [ProgramState(instructionPointer: 1, accumulator: 1024),
                      ProgramState(instructionPointer: 2, accumulator: 2048),
                      ProgramState(instructionPointer: 3, accumulator: 4096)]
        
        let program = [aInstruction(returning: states[0]),
                       aInstruction(returning: states[1]),
                       aInstruction(returning: states[2])]
        
        let _ = runner.run(program: program)
        
        XCTAssertEqual(program[0].executeParameters, [initialState])
        XCTAssertEqual(program[1].executeParameters, [states[0]])
        XCTAssertEqual(program[2].executeParameters, [states[1]])
    }
    
    func testStopsExecutionIfInstructionWouldBeExecutedTwice() {
        
        let expectedAccumulator = 1024
        
        let program = [aInstruction(returning: ProgramState(instructionPointer: 2, accumulator: 0)),
                       aInstruction(returning: ProgramState(instructionPointer: 0, accumulator: expectedAccumulator)),
                       aInstruction(returning: ProgramState(instructionPointer: 1, accumulator: 0))]
        
        let accumulator = runner.run(program: program)
        
        XCTAssertEqual(accumulator, expectedAccumulator)
    }
    
    func testExampleInput() {
                
        let program: [Instruction] = Day8RawInputParser.parse(raw: ProgramRawInput.example)
        
        let accumulator = runner.run(program: program)
        
        XCTAssertEqual(accumulator, 5)
    }
    
    private func aInstruction(returning programState: ProgramState) -> InstructionSpy {
        let instruction = InstructionSpy()
        instruction.executeReturnValue = programState
        return instruction
    }
}

class InstructionSpy: Instruction {
    
    var executeTimesCalled = 0
    var executeParameters = [ProgramState]()
    var executeReturnValue: ProgramState!
    
    func execute(programState: ProgramState) -> ProgramState {
        executeTimesCalled += 1
        executeParameters += [programState]
        return executeReturnValue
    }
}
