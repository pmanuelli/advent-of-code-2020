protocol Field {
    var key: String { get }
    func isValidValue(_ value: String) -> Bool
}

struct BirthYearField: Field {
    let key = "byr"
    
    func isValidValue(_ value: String) -> Bool { Validations.value(value, isNumberInRange: (1920...2002)) }
}

struct IssueYearField: Field {
    let key = "iyr"
    
    func isValidValue(_ value: String) -> Bool { Validations.value(value, isNumberInRange: (2010...2020)) }
}

struct ExpirationYearField: Field {
    let key = "eyr"
    
    func isValidValue(_ value: String) -> Bool { Validations.value(value, isNumberInRange: (2020...2030)) }
}

struct HeightField: Field {
    let key = "hgt"
    
    func isValidValue(_ value: String) -> Bool {
        
        let numericValue = value.prefix(while: { $0.isNumber })
        let nonNumericValue = value.replacingOccurrences(of: numericValue, with: "")
                
        switch nonNumericValue {
        case "cm":
            return Validations.value(numericValue, isNumberInRange: (150...193))
        case "in":
            return Validations.value(numericValue, isNumberInRange: (59...76))
        default:
            return false
        }
    }
}

import Foundation

struct HairColorField: Field {
    let key = "hcl"
    
    func isValidValue(_ value: String) -> Bool { Validations.valueIsColor(value) }
}

struct EyesColorField: Field {
    let key = "ecl"
    
    func isValidValue(_ value: String) -> Bool {
        ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(value)
    }
}

struct PassportIdField: Field {
    let key = "pid"
    
    func isValidValue(_ value: String) -> Bool { Validations.value(value, hasOnlyDecimalDigitsCount: 9)}
}

struct Validations {
    
    static func value(_ substringValue: Substring, isNumberInRange range: ClosedRange<Int>) -> Bool {
        return value(String(substringValue), isNumberInRange: range)
    }
    
    static func value(_ stringValue: String, isNumberInRange range: ClosedRange<Int>) -> Bool {
        guard let number = Int(stringValue) else { return false }
        return range.contains(number)
    }
    
    static func valueIsColor(_ stringValue: String) -> Bool {
        guard stringValue.count == 7, stringValue.hasPrefix("#") else { return false }
        
        return stringValue
            .suffix(6)
            .allSatisfy { $0.isNumber || $0.isHexDigit }
    }
    
    static func value(_ stringValue: String, hasOnlyDecimalDigitsCount count: Int) -> Bool {
        return stringValue.count == count && stringValue.allSatisfy { $0.isNumber }
    }
}

