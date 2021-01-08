import XCTest

class ContainerBagsCounterTest: XCTestCase {

    func testZeroBagsIfRulesAreEmpty() {
            
        let counter = ContainerBagsCounter(rules: [])
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: "any color"), 0)
    }
    
    func testBagsThatContainsDirectlyTheSearchedBag() {
    
        let colorToSearch = "color to search"
        
        let bagRules = [BagRule(containerBagColor: "color a", contentBags: [aContentBag(color: colorToSearch)]),
                        BagRule(containerBagColor: "color b", contentBags: [aContentBag(color: colorToSearch)]),
                        BagRule(containerBagColor: "color c", contentBags: [aContentBag(color: colorToSearch),
                                                                            aContentBag(color: "other color")])]
        
        let counter = ContainerBagsCounter(rules: bagRules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: colorToSearch), 3)
    }
    
    func testBagsThatContainsIndirectlyTheSearchedBag() {
    
        let colorToSearch = "color to search"
        
        let bagRules = [BagRule(containerBagColor: "color a", contentBags: [aContentBag(color: "color b")]),
                        BagRule(containerBagColor: "color b", contentBags: [aContentBag(color: "color c")]),
                        BagRule(containerBagColor: "color c", contentBags: [aContentBag(color: colorToSearch),
                                                                            aContentBag(color: "other color")])]
        
        let counter = ContainerBagsCounter(rules: bagRules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: colorToSearch), 3)
    }
    
    func testIgnoresBagsThatDoesNotContainTheSearchedBag() {
    
        let colorToSearch = "color to search"
        
        let bagRules = [BagRule(containerBagColor: "color a", contentBags: [aContentBag(color: colorToSearch)]),
                        BagRule(containerBagColor: "color x", contentBags: [aContentBag(color: "color z")]),
                        BagRule(containerBagColor: "color z", contentBags: [])]
        
        let counter = ContainerBagsCounter(rules: bagRules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: colorToSearch), 1)
    }
    
    func testDoesNotCountTwiceBags() {
    
        let colorToSearch = "color to search"
        
        let bagRules = [BagRule(containerBagColor: "color a", contentBags: [aContentBag(color: "color c"), aContentBag(color: "color d")]),
                        BagRule(containerBagColor: "color c", contentBags: [aContentBag(color: colorToSearch)]),
                        BagRule(containerBagColor: "color d", contentBags: [aContentBag(color: colorToSearch)])]
        
        let counter = ContainerBagsCounter(rules: bagRules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: colorToSearch), 3)
    }
    
    func testExampleInput() {
                    
        let rules = Day7RawInputParser.parse(raw: BagRulesRawInput.example)
        
        let counter = ContainerBagsCounter(rules: rules)
        
        XCTAssertEqual(counter.numberOfBagsContainingEventuallyBag(color: "shiny gold"), 4)
    }
    
    private func aContentBag(color: String) -> BagRule.ContentBag {
        return BagRule.ContentBag(amount: 0, color: color)
    }
}
