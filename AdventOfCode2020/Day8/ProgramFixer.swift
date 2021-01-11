class ProgramFixer {
    
    private let runner: ProgramRunnerProtocol
    
    init(runner: ProgramRunnerProtocol) {
        self.runner = runner
    }
    
    func run(program: [Instruction]) -> ExecutionResult {
        
        for instructionPointer in program.indices {
            
            let (modifiedProgram, modified) = modifyProgram(program, changingInstructionAt: instructionPointer)
            
            guard modified else { continue }
                        
            let result = runner.run(program: modifiedProgram)
            
            if result.terminatedNormally {
                return result
            }
        }
        
        return runner.run(program: program)
    }
    
    private func modifyProgram(_ program: [Instruction],
                               changingInstructionAt instructionPointer: InstructionPointer) -> ([Instruction], modified: Bool) {
        
        guard let fixedInstruction = fixInstruction(program[instructionPointer]) else { return (program, modified: false) }
        
        var modifiedProgram = program
        modifiedProgram[instructionPointer] = fixedInstruction
        
        return (modifiedProgram, modified: true)
    }
    
    private func fixInstruction(_ instruction: Instruction) -> Instruction? {
     
        if let instruction = instruction as? NoOperationInstruction {
            return JumpInstruction(argument: instruction.argument)
        }
        
        if let instruction = instruction as? JumpInstruction {
            return NoOperationInstruction(argument: instruction.argument)
        }
        
        return nil
    }
}
