enum Day1RawInputParser {
    
    static func parse(_ raw: String) -> [Int] {
        raw.components(separatedBy: .newlines).compactMap { Int($0) }
    }
}


