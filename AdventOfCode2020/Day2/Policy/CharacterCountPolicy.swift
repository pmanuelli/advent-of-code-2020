struct CharacterCountPolicy: Policy {
    
    private let minCount: Int
    private let maxCount: Int
    private let character: String
    
    init(minCount: Int, maxCount: Int, character: String) {
        self.minCount = minCount
        self.maxCount = maxCount
        self.character = character
    }
    
    // example: "1-3 a"
    static func from(raw text: String) -> Policy {
        
        let rangeAndCharacterComponents = text.components(separatedBy: " ") // ["1-3", "a"]
        let rangeComponents = rangeAndCharacterComponents[0].components(separatedBy: "-") // ["1", "3"]
        
        return CharacterCountPolicy(minCount: Int(rangeComponents[0])!,
                                    maxCount: Int(rangeComponents[1])!,
                                    character: rangeAndCharacterComponents[1])
    }
    
    func validates(_ password: Password) -> Bool {
        
        let numberOfOccurrences = password.raw
            .filter { "\($0)" == character }
            .count
        
        return (minCount...maxCount).contains(numberOfOccurrences)
    }
}

extension CharacterCountPolicy: Equatable { }
