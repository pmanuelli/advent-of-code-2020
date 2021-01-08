struct BagRule {
    
    let containerBagColor: BagColor
    let contentBags: [ContentBag]
    
    struct ContentBag {
        let amount: Int
        let color: BagColor
    }
}

extension BagRule: Equatable { }

extension BagRule.ContentBag: Equatable { }
