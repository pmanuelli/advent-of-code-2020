struct CharacterPositionPolicy: Policy {
    
    private let firstPosition: Int
    private let secondPosition: Int
    private let character: String
    
    init(firstPosition: Int, secondPosition: Int, character: String) {
        self.firstPosition = firstPosition
        self.secondPosition = secondPosition
        self.character = character
    }
    
    // example: "1-3 a"
    static func from(raw text: String) -> Policy {
        
        let rangeAndCharacterComponents = text.components(separatedBy: " ") // ["1-3", "a"]
        let rangeComponents = rangeAndCharacterComponents[0].components(separatedBy: "-") // ["1", "3"]
        
        return CharacterPositionPolicy(firstPosition: Int(rangeComponents[0])!,
                                       secondPosition: Int(rangeComponents[1])!,
                                       character: rangeAndCharacterComponents[1])
    }
    
    func validates(_ password: Password) -> Bool {

        let passwordRaw = password.raw
        let startIndex = passwordRaw.startIndex
        let endIndex = passwordRaw.endIndex
        
        guard let firstPositionIndex = passwordRaw.index(startIndex, offsetBy: firstPosition - 1, limitedBy: endIndex),
              let secondPositionIndex = passwordRaw.index(startIndex, offsetBy: secondPosition - 1, limitedBy: endIndex),
              firstPositionIndex != endIndex,
              secondPositionIndex != endIndex else { return false }
        
        let firstCharacter = String(passwordRaw[firstPositionIndex])
        let secondCharacter = String(passwordRaw[secondPositionIndex])
        
        return xor(firstCharacter == character, secondCharacter == character)
    }
    
    private func xor(_ left: Bool, _ right: Bool) -> Bool { left != right }
}

extension CharacterPositionPolicy: Equatable { }
