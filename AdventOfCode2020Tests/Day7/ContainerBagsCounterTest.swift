import XCTest

class ContainerBagsCounterTest: XCTestCase {

    func testZeroBagsIfRulesAreEmpty() {
            
        let counter = ContainerBagsCounter(rules: [])
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: "any color"), 0)
    }
    
    func testBagsThatContainsDirectlyTheSearchedBag() {
    
        let colorToSearch = "color to search"
        
        let bagRules = [BagRule(containerBagColor: "color a", containedBagsInfo: [aBagInfoWithColor(colorToSearch)]),
                        BagRule(containerBagColor: "color b", containedBagsInfo: [aBagInfoWithColor(colorToSearch)]),
                        BagRule(containerBagColor: "color c", containedBagsInfo: [aBagInfoWithColor(colorToSearch),
                                                                                  aBagInfoWithColor("color color")])]
        
        let counter = ContainerBagsCounter(rules: bagRules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: colorToSearch), 3)
    }
    
    func testBagsThatContainsIndirectlyTheSearchedBag() {
    
        let colorToSearch = "color to search"
        
        let bagRules = [BagRule(containerBagColor: "color a", containedBagsInfo: [aBagInfoWithColor("color b")]),
                        BagRule(containerBagColor: "color b", containedBagsInfo: [aBagInfoWithColor("color c")]),
                        BagRule(containerBagColor: "color c", containedBagsInfo: [aBagInfoWithColor(colorToSearch),
                                                                                  aBagInfoWithColor("other color")])]
        
        let counter = ContainerBagsCounter(rules: bagRules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: colorToSearch), 3)
    }
    
    func testIgnoresBagsThatDoesNotContainTheSearchedBag() {
    
        let colorToSearch = "color to search"
        
        let bagRules = [BagRule(containerBagColor: "color a", containedBagsInfo: [aBagInfoWithColor(colorToSearch)]),
                        BagRule(containerBagColor: "color x", containedBagsInfo: [aBagInfoWithColor("color z")]),
                        BagRule(containerBagColor: "color z", containedBagsInfo: [])]
        
        let counter = ContainerBagsCounter(rules: bagRules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: colorToSearch), 1)
    }
    
    func testDoesNotCountTwiceBags() {
    
        let colorToSearch = "color to search"
        
        let bagRules = [BagRule(containerBagColor: "color a", containedBagsInfo: [aBagInfoWithColor("color c"), aBagInfoWithColor("color d")]),
                        BagRule(containerBagColor: "color c", containedBagsInfo: [aBagInfoWithColor(colorToSearch)]),
                        BagRule(containerBagColor: "color d", containedBagsInfo: [aBagInfoWithColor(colorToSearch)])]
        
        let counter = ContainerBagsCounter(rules: bagRules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: colorToSearch), 3)
    }
    
    func testExampleInput() {
                    
        let rules = Day7RawInputParser.parse(raw: BagRulesRawInput.example)
        
        let counter = ContainerBagsCounter(rules: rules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: "shiny gold"), 4)
    }
    
    private func aBagInfoWithColor(_ color: String) -> BagRule.ContentBagInfo {
        return BagRule.ContentBagInfo(color: color, amount: 0)
    }
}
