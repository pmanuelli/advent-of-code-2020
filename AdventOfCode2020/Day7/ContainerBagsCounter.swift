class ContainerBagsCounter {

    private var bagsByColor = [BagColor: Bag]()
    
    init(rules: [BagRule]) {
        
        for rule in rules {
            
            for bagColor in rule.containedBagsInfo.map({ $0.color }) {
                
                let bag = bagsByColor[bagColor] ?? Bag(color: bagColor)
                let updatedBag = bag.addingContainerBagColor(rule.containerBagColor)
                
                bagsByColor[bagColor] = updatedBag
            }
        }
    }
    
    func numberOfBagsContainingEventuallyBag(color: BagColor) -> Int {
        colorsOfBagsContainingEventuallyBag(color: color).count
    }
    
    private func colorsOfBagsContainingEventuallyBag(color: BagColor) -> Set<BagColor> {
        guard let bag = bagsByColor[color] else { return Set() }

        var result = Set(bag.containerBagsColors)
        
        for containerBagName in bag.containerBagsColors {
            result = result.union(colorsOfBagsContainingEventuallyBag(color: containerBagName))
        }
        
        return result
    }
    
    func numberOfBagsContainedByBag(color: BagColor) -> Int {
        return 0
    }
}
