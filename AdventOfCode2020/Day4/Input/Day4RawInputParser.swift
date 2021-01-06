import Foundation

class Day4RawInputParser {
    
    static func parse(raw: String) -> [[String: String]] {
    
        let keysAndValues = raw.components(separatedBy: .whitespacesAndNewlines) + [""]

        var result = [[String: String]]()
        var accumulatedData = [String: String]()
        
        for keyAndValue in keysAndValues {
            
            if keyAndValue.isEmpty {
                result.append(accumulatedData)
                accumulatedData = [String: String]()
            }
            else {
                let components = keyAndValue.components(separatedBy: ":")
                accumulatedData[components[0]] = components[1]
            }
        }
        
        return result
    }
}
