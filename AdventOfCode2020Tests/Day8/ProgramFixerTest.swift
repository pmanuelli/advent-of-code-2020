import XCTest

class ProgramFixerTest: XCTestCase {

    private let originalProgram: [Instruction] = [NoOperationInstruction(argument: 1),
                                                  JumpInstruction(argument: -3),
                                                  AccumulateInstruction(argument: 8)]
    
    private let runner = ProgramRunnerSpy()
    
    private lazy var fixer = ProgramFixer(runner: runner)

    func testRunFixedPrograms() {
        
        givenARunnerReturning(ExecutionResult(accumulator: 0, terminatedNormally: false))
    
        let _ = fixer.run(program: originalProgram)
        
        thenProgramRunAtPosition(0, is: [JumpInstruction(argument: 1),
                                         JumpInstruction(argument: -3),
                                         AccumulateInstruction(argument: 8)])
        
        thenProgramRunAtPosition(1, is: [NoOperationInstruction(argument: 1),
                                         NoOperationInstruction(argument: -3),
                                         AccumulateInstruction(argument: 8)])
        
        thenProgramRunAtPosition(2, is: [NoOperationInstruction(argument: 1),
                                         JumpInstruction(argument: -3),
                                         AccumulateInstruction(argument: 8)])
    }
    
    func testReturnsResultOfFirstFixedProgramThatTerminatesNormally() {
        
        let expectedResult = ExecutionResult(accumulator: 1024, terminatedNormally: true)
        
        givenARunnerReturning([ExecutionResult(accumulator: 0, terminatedNormally: false),
                               expectedResult])
        
        let result = fixer.run(program: originalProgram)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testReturnsLastResultIfNoFixedProgramTerminatesNormally() {
        
        let expectedResult = ExecutionResult(accumulator: 1024, terminatedNormally: false)

        givenARunnerReturning([ExecutionResult(accumulator: 0, terminatedNormally: false),
                               expectedResult])
    
        let result = fixer.run(program: originalProgram)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testExampleInput() {
        
        let program = Day8RawInputParser.parse(raw: ProgramRawInput.example)
        let fixer = ProgramFixer(runner: ProgramRunner())
        
        let result = fixer.run(program: program)
        
        XCTAssertEqual(result.accumulator, 8)
    }
    
    private func givenARunnerReturning(_ returnValue: ExecutionResult) {
        runner.runReturnValues = [returnValue]
    }
    
    private func givenARunnerReturning(_ returnValues: [ExecutionResult]) {
        runner.runReturnValues = returnValues
    }
    
    private func thenProgramRunAtPosition(_ index: Int, is program: [Instruction]) {
        
        let fixedProgram = runner.runParameters[index]
        
        XCTAssertEqual(fixedProgram.count, program.count)
        
        for (index, instruction) in program.enumerated() {
            XCTAssertEqualInstruction(instruction, fixedProgram[index])
        }
    }
    
    private func XCTAssertEqualInstruction(_ lhs: Instruction, _ rhs: Instruction) {
        
        if let lhs = lhs as? NoOperationInstruction,
           let rhs = rhs as? NoOperationInstruction {
            XCTAssertEqual(lhs, rhs)
            
        } else if let lhs = lhs as? JumpInstruction,
           let rhs = rhs as? JumpInstruction {
            XCTAssertEqual(lhs, rhs)
            
        } else if let lhs = lhs as? AccumulateInstruction,
           let rhs = rhs as? AccumulateInstruction {
            XCTAssertEqual(lhs, rhs)
            
        } else {
            XCTFail("Operations does not match: \(lhs) - \(rhs)")
        }
    }
}

class ProgramRunnerSpy: ProgramRunnerProtocol {
    
    var runTimesCalled = 0
    var runParameters = [[Instruction]]()
    var runReturnValues = [ExecutionResult]()
    
    func run(program: [Instruction]) -> ExecutionResult {
        
        let returnValue = getReturnValue(at: runTimesCalled)
        
        runTimesCalled += 1
        runParameters += [program]
        return returnValue
    }
    
    private func getReturnValue(at index: Int) -> ExecutionResult {
        runReturnValues.indices.contains(index) ? runReturnValues[index] : runReturnValues.last!
    }
}
