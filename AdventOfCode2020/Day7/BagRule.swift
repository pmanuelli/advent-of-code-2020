struct BagRule {
    
    let containerBagColor: BagColor
    let containedBagsInfo: [ContentBagInfo]
    
    struct ContentBagInfo {
        let color: BagColor
        let amount: Int
    }
}

extension BagRule: Equatable { }

extension BagRule.ContentBagInfo: Equatable { }
