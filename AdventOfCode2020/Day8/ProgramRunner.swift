struct ExecutionResult {
    
    let accumulator: Accumulator
    let terminatedNormally: Bool
}

extension ExecutionResult: Equatable { }

protocol ProgramRunnerProtocol {
    func run(program: [Instruction]) -> ExecutionResult
}

class ProgramRunner: ProgramRunnerProtocol {

    func run(program: [Instruction]) -> ExecutionResult {
        
        var state = ProgramState(instructionPointer: 0, accumulator: 0)
        var executedInstructionPointers = Set<InstructionPointer>()
        
        while instructionPointerIsInProgramsRange(instructionPointer: state.instructionPointer, program: program) {
            guard instructionWasNotExecutedBefore(instructionPointer: state.instructionPointer,
                                                  executedInstructionPointers: executedInstructionPointers) else {
                
                return ExecutionResult(accumulator: state.accumulator, terminatedNormally: false)
            }
            
            let instructionPointer = state.instructionPointer
        
            state = program[instructionPointer].execute(programState: state)
            executedInstructionPointers.insert(instructionPointer)
        }
        
        return ExecutionResult(accumulator: state.accumulator, terminatedNormally: true)
    }
    
    private func shouldContinueExecution(instructionPointer: InstructionPointer,
                                         program: [Instruction],
                                         executedInstructionPointers: Set<InstructionPointer>) -> Bool {
        
        return program.indices.contains(instructionPointer) &&
            !executedInstructionPointers.contains(instructionPointer)
    }
    
    private func instructionPointerIsInProgramsRange(instructionPointer: InstructionPointer, program: [Instruction]) -> Bool {
        program.indices.contains(instructionPointer)
    }
    
    private func instructionWasNotExecutedBefore(instructionPointer: InstructionPointer,
                                                 executedInstructionPointers: Set<InstructionPointer>) -> Bool {
        !executedInstructionPointers.contains(instructionPointer)
    }
}
