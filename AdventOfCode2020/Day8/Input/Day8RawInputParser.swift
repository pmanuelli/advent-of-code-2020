struct Day8RawInputParser {

    static func parse(raw: String) -> [Instruction] {
        raw
            .components(separatedBy: .newlines)
            .compactMap { createInstruction(from: $0) }
    }
    
    private static func createInstruction(from line: String) -> Instruction? {
        let components = line.components(separatedBy: .whitespaces)
        
        let argument = Int(components[1])!
        
        switch components[0] {
        case "acc":
            return AccumulateInstruction(argument: argument)
        case "jmp":
            return JumpInstruction(argument: argument)
        case "nop":
            return NoOperationInstruction(argument: argument)
        default:
            return nil
        }
    }
}
