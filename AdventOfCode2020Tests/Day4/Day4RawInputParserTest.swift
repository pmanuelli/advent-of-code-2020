import XCTest

class Day4RawInputParserTest: XCTestCase {

    func test____Example() throws {
        
        let raw =
            """
            ecl:gry eyr:2020
            byr:1937
            iyr:2017

            iyr:2013 pid:02804
            hcl:#cfa07d byr:1929
            """
        
        let data = Day4RawInputParser.parse(raw: raw)
        
        let expectedData1 = ["ecl": "gry",
                             "eyr": "2020",
                             "byr": "1937",
                             "iyr": "2017"]
        
        let expectedData2 = ["iyr": "2013",
                             "pid": "02804",
                             "hcl": "#cfa07d",
                             "byr": "1929"]
        
        XCTAssertEqual(data, [expectedData1, expectedData2])
    }
}
