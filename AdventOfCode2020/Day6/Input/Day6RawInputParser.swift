struct Day6RawInputParser {
    
    static func parse(raw: String) -> [[String]] {
        let answersByLine = raw.components(separatedBy: .newlines) + [""]
        
        var groupAnswers = [String]()
        var groupsAnswers = [[String]]()
        
        for answerLine in answersByLine {
            
            if answerLine.isEmpty {
                groupsAnswers.append(groupAnswers)
                groupAnswers = []
            }
            else {
                groupAnswers.append(answerLine)
            }
        }
        
        return groupsAnswers
    }
    
}
