class QuestionAnswersCounter {
    
    func numberOfQuestionsWithAtLeastOneAnswerInGroup(_ groupAnswers: [String]) -> Int {
        
        var differentAnswers = Set<Character>()
        
        for answers in groupAnswers {
            for answer in answers {
                differentAnswers.insert(answer)
            }
        }
        
        return differentAnswers.count
    }
    
    func numberOfQuestionsWithAtLeastOneAnswerInGroups(_ groupsAnswers: [[String]]) -> [Int] {
        groupsAnswers.map { numberOfQuestionsWithAtLeastOneAnswerInGroup($0) }
    }
    
    func numberOfQuestionsThatAllAnsweredInGroup(_ groupAnswers: [String]) -> Int {
        
        var answersCount = [Character: Int]()
        
        for answers in groupAnswers {
            for answer in answers {
                answersCount[answer] = (answersCount[answer] ?? 0) + 1
            }
        }
        
        let expectedAnswersCount = groupAnswers.count
        return answersCount.filter { $0.value == expectedAnswersCount }.count
    }
    
    func numberOfQuestionsThatAllAnsweredInGroups(_ groupsAnswers: [[String]]) -> [Int] {
        groupsAnswers.map { numberOfQuestionsThatAllAnsweredInGroup($0) }
    }
}
