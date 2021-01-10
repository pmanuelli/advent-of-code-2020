class ProgramRunner {

    func run(program: [Instruction]) -> Accumulator {
        
        var state = ProgramState(instructionPointer: 0, accumulator: 0)
        var executedInstructionPointers = Set<InstructionPointer>()
        
        while shouldContinueExecution(instructionPointer: state.instructionPointer,
                                      program: program,
                                      executedInstructionPointers: executedInstructionPointers) {
            
            let instructionPointer = state.instructionPointer
        
            state = program[instructionPointer].execute(programState: state)
            executedInstructionPointers.insert(instructionPointer)
        }
        
        return state.accumulator
    }
    
    private func shouldContinueExecution(instructionPointer: InstructionPointer,
                                         program: [Instruction],
                                         executedInstructionPointers: Set<InstructionPointer>) -> Bool {
        
        return program.indices.contains(instructionPointer) &&
            !executedInstructionPointers.contains(instructionPointer)
    }
}
