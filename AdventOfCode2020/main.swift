import Foundation

printDay1Results()
printDay2Results()
printDay3Results()
printDay4Results()
printDay5Results()
printDay6Results()
printDay7Results()

func printDay1Results() {
    
    let expensesInput = Day1RawInputParser.parse(ExpensesRawInput.exercise)
    let expensesCalculator = ExpensesCalculator()

    print("Day 1 - First")
    print(expensesCalculator.multiplyTwoExpensesThatSums2020(expenses: expensesInput))
    print("Day 1 - Second")
    print(expensesCalculator.multiplyThreeExpensesThatSums2020(expenses: expensesInput))
}

func printDay2Results() {
    
    let passwordsAndPoliciesFirstInput = Day2RawInputParser.parse(raw: PasswordsAndPoliciesRawInput.exercise,
                                                                  policyFactory: CharacterCountPolicyFactory())
    
    let passwordsAndPoliciesSecondInput = Day2RawInputParser.parse(raw: PasswordsAndPoliciesRawInput.exercise,
                                                                   policyFactory: CharacterPositionPolicyFactory())
    let validPasswordsCounter = ValidPasswordsCounter()

    print("Day 2 - First")
    print(validPasswordsCounter.numberOfValidPasswords(passwordsAndPoliciesFirstInput))
    print("Day 2 - Second")
    print(validPasswordsCounter.numberOfValidPasswords(passwordsAndPoliciesSecondInput))
}

func printDay3Results() {
    
    let patternParsedInput = Day3RawInputParser.parse(raw: MapPatternRawInput.exercise)
    let map = Map(patternHeight: patternParsedInput.height,
                  patternWidth: patternParsedInput.width,
                  patternPositionsWithTree: patternParsedInput.positionsWithTree)

    let slopes: [Slope] = [Right1Down1Slope(),
                           Right3Down1Slope(),
                           Right5Down1Slope(),
                           Right7Down1Slope(),
                           Right1Down2Slope()]

    print("Day 3 - First")
    print(map.numberOfTrees(in: Right3Down1Slope()))
    print("Day 3 - Second")
    print(slopes.map { map.numberOfTrees(in: $0) }.reduce(1, { $0 * $1 }))
}

func printDay4Results() {
    
    let fields = PassportDataMandatoryFields.fields
    let fieldsValidator = PassportFieldsValidator(mandatoryFields: fields.map { $0.key })
    let fieldsAndValuesValidator = PassportFieldsAndValuesValidator(mandatoryFields: fields)

    let batch = Day4RawInputParser.parse(raw: PassportDataRawInput.exercise)

    print("Day 4 - First")
    print(fieldsValidator.countNumberOfValidData(batch: batch))
    print("Day 4 - Second")
    print(fieldsAndValuesValidator.countNumberOfValidData(batch: batch))
}

func printDay5Results() {
    
    let partitions = Day5RawInputParser.parse(raw: BinarySpacePartitionRawInput.exercise)
    let ids = Set(partitions.map { try! Seat(binarySpacePartition: $0).id })
    
    print("Day 5 - First")
    print(ids.max()!)
    
    let firstPossibleId = Seat(row: 1, column: 0).id
    let lastPossibleId = Seat(row: 126, column: 7).id
    
    print("Day 5 - Second")
    
    for id in (firstPossibleId...lastPossibleId) {
        if ids.contains(id - 1) && ids.contains(id + 1) && !ids.contains(id) {
            print(id)
        }
    }
}

func printDay6Results() {
    
    let groupsAnswers = Day6RawInputParser.parse(raw: GroupsAnswersRawInput.exercise)
    let counter = QuestionAnswersCounter()
    
    let firstSum = counter.numberOfQuestionsWithAtLeastOneAnswerInGroups(groupsAnswers).reduce(0) { $0 + $1 }
    let secondSum = counter.numberOfQuestionsThatAllAnsweredInGroups(groupsAnswers).reduce(0) { $0 + $1 }
    
    print("Day 6 - First")
    print(firstSum)
    print("Day 6 - Second")
    print(secondSum)
}

func printDay7Results() {
    
    let rules = Day7RawInputParser.parse(raw: BagRulesRawInput.exercise)
    
    print("Day 7 - First")
    print(ContainerBagsCounter(rules: rules).numberOfBagsContainingEventuallyBag(color: "shiny gold"))
    
    print("Day 7 - Second")
    print(BagsContainedCounter(rules: rules).numberOfBagsContainedInsideOfBag(color: "shiny gold"))
}
