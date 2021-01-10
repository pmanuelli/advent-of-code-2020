protocol Instruction {
    func execute(programState: ProgramState) -> ProgramState
}

struct AccumulateInstruction: Instruction {
    let argument: Int
    
    func execute(programState: ProgramState) -> ProgramState {
        ProgramState(instructionPointer: programState.instructionPointer + 1,
                     accumulator: programState.accumulator + argument)
    }
}

extension AccumulateInstruction: Equatable { }

struct JumpInstruction: Instruction {
    let argument: Int
    
    func execute(programState: ProgramState) -> ProgramState {
        ProgramState(instructionPointer: programState.instructionPointer + argument,
                     accumulator: programState.accumulator)
    }
}

extension JumpInstruction: Equatable { }

struct NoOperationInstruction: Instruction {
    func execute(programState: ProgramState) -> ProgramState {
        ProgramState(instructionPointer: programState.instructionPointer + 1,
                     accumulator: programState.accumulator)
    }
}

extension NoOperationInstruction: Equatable { }
