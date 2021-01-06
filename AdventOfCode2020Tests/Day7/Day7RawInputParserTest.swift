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
        let expectedRules = [BagRule(containerBagColor: "dark orange", containedBagsInfo: [aContentBagInfo(0, "bright white")]),
                             BagRule(containerBagColor: "dark orange", containedBagsInfo: [aContentBagInfo(0, "bright white"),
                                                                                           aContentBagInfo(0, "muted yellow")]),
                             BagRule(containerBagColor: "dark orange", containedBagsInfo: [aContentBagInfo(0, "bright white"),
                                                                                           aContentBagInfo(0, "muted yellow"),
                                                                                           aContentBagInfo(0, "mirrored olive")]),
                             BagRule(containerBagColor: "dark orange", containedBagsInfo: [])]
        
        XCTAssertEqual(rules, expectedRules)
    }
    
    private func aContentBagInfo( _ amount: Int, _ color: BagColor) -> BagRule.ContentBagInfo {
        BagRule.ContentBagInfo(color: color, amount: amount)
    }
}
