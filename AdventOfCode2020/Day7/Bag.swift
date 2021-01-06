typealias BagColor = String

struct Bag {

    let color: BagColor
    let containerBagsColors: [BagColor]
    
    init(color: BagColor) {
        self.color = color
        self.containerBagsColors = []
    }
    
    private init(color: BagColor, containerBagsColors: [BagColor]) {
        self.color = color
        self.containerBagsColors = containerBagsColors
    }
    
    func addingContainerBagColor(_ containerBagColor: BagColor) -> Bag {
        return Bag(color: self.color, containerBagsColors: self.containerBagsColors + [containerBagColor])
    }
}
