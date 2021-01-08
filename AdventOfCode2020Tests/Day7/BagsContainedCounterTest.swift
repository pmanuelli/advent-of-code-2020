import XCTest

class BagsContainedCounterTest: XCTestCase {

    func testReturnsFirstLevelOfContainedBags() {
        
        let rules = [BagRule(containerBagColor: "color a", contentBags: [aContentBag(2, "color b"),
                                                                         aContentBag(3, "color c")]),
                     BagRule(containerBagColor: "color b", contentBags: []),
                     BagRule(containerBagColor: "color c", contentBags: [])]
        
        let counter = BagsContainedCounter(rules: rules)
        
        XCTAssertEqual(5, counter.numberOfBagsContainedInsideOfBag(color: "color a"))
    }
    
    func testAccumulatesFirstAndSecondLevelOfContainedBags() {
        
        let rules = [BagRule(containerBagColor: "color a", contentBags: [aContentBag(2, "color b"),
                                                                         aContentBag(3, "color c")]),
                     BagRule(containerBagColor: "color b", contentBags: [aContentBag(1, "color d")]),
                     BagRule(containerBagColor: "color c", contentBags: [aContentBag(4, "color e")]),
                     BagRule(containerBagColor: "color d", contentBags: []),
                     BagRule(containerBagColor: "color e", contentBags: [])]
        
        let counter = BagsContainedCounter(rules: rules)
        
        XCTAssertEqual(19, counter.numberOfBagsContainedInsideOfBag(color: "color a"))
    }
    
    func testAccumulatesAllLevelsOfContainedBags() {
        
        let raw =
            """
            shiny gold bags contain 2 dark red bags.
            dark red bags contain 2 dark orange bags.
            dark orange bags contain 2 dark yellow bags.
            dark yellow bags contain 2 dark green bags.
            dark green bags contain 2 dark blue bags.
            dark blue bags contain 2 dark violet bags.
            dark violet bags contain no other bags.
            """
        
        let rules = Day7RawInputParser.parse(raw: raw)
        let counter = BagsContainedCounter(rules: rules)
        
        XCTAssertEqual(126, counter.numberOfBagsContainedInsideOfBag(color: "shiny gold"))
    }
    
    private func aContentBag( _ amount: Int, _ color: BagColor) -> BagRule.ContentBag {
        BagRule.ContentBag(amount: amount, color: color)
    }
}
