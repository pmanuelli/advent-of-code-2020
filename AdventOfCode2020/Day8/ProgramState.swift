typealias InstructionPointer = Int
typealias Accumulator = Int

struct ProgramState {
    let instructionPointer: InstructionPointer
    let accumulator: Accumulator
}

extension ProgramState: Equatable { }
