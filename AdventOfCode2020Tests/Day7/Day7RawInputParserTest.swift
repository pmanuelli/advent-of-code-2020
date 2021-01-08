import XCTest

class Day7RawInputParserTest: XCTestCase {

    func testParsesRawInput() {
        
        let raw =
            """
            dark orange bags contain 3 bright white bag.
            dark orange bags contain 3 bright white bags, 4 muted yellow bags.
            dark orange bags contain 3 bright white bags, 4 muted yellow bags, 2 mirrored olive bags.
            dark orange bags contain no other bags.
            """
        
        let rules = Day7RawInputParser.parse(raw: raw)
        let expectedRules = [BagRule(containerBagColor: "dark orange", contentBags: [aContentBag(3, "bright white")]),
                             BagRule(containerBagColor: "dark orange", contentBags: [aContentBag(3, "bright white"),
                                                                                     aContentBag(4, "muted yellow")]),
                             BagRule(containerBagColor: "dark orange", contentBags: [aContentBag(3, "bright white"),
                                                                                     aContentBag(4, "muted yellow"),
                                                                                     aContentBag(2, "mirrored olive")]),
                             BagRule(containerBagColor: "dark orange", contentBags: [])]
        
        XCTAssertEqual(rules, expectedRules)
    }
    
    private func aContentBag( _ amount: Int, _ color: BagColor) -> BagRule.ContentBag {
        BagRule.ContentBag(amount: amount, color: color)
    }
}
