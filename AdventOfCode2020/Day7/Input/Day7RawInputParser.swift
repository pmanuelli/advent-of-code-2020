struct Day7RawInputParser {
    
    static func parse(raw: String) -> [BagRule] {
        return raw
            .components(separatedBy: .newlines)
            .map { createBagRule(from: $0) }
    }
    
    private static func createBagRule(from line: String) -> BagRule {
        
        // Examples:
        // light red bags contain 1 bright white bag.
        // dark orange bags contain 3 bright white bags, 4 muted yellow bags.
        // faded blue bags contain no other bags.
        
        let words = line.components(separatedBy: .whitespacesAndNewlines)
        
        let containerBagColor = words[0] + " " + words[1]
        
        if words[4] == "no" {
            return BagRule(containerBagColor: containerBagColor, containedBagsInfo: [])
        }
        else {
            
            let contentWords = Array(words.dropFirst(4))
            let numberOfContents = contentWords.count/4
            
            let containedBagsInfo: [BagRule.ContentBagInfo] = (0..<numberOfContents).map {
                createContentBagInfo(index: $0, contentWords: contentWords)
            }
            
            return BagRule(containerBagColor: containerBagColor, containedBagsInfo: containedBagsInfo)
        }
    }
    
    private static func createContentBagInfo(index: Int, contentWords: [String]) -> BagRule.ContentBagInfo {
        let firstColor = contentWords[index * 4 + 1]
        let secondColor = contentWords[index * 4 + 2]
        return BagRule.ContentBagInfo(color: firstColor + " " + secondColor, amount: 0)
    }
}
