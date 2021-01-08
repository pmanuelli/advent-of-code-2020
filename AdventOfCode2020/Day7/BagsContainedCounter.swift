class BagsContainedCounter {
    
    private var contentByColor = [BagColor: [BagRule.ContentBag]]()
    
    init(rules: [BagRule]) {
        
        for rule in rules {
            contentByColor[rule.containerBagColor] = rule.contentBags
        }
    }
    
    func numberOfBagsContainedInsideOfBag(color: BagColor) -> Int {
        guard let contents = contentByColor[color] else { return 0 }
        
        return contents.reduce(0) { $0 + $1.amount + $1.amount * numberOfBagsContainedInsideOfBag(color: $1.color) }
    }
}
