struct ExpensesCalculator {
    
    func multiplyTwoExpensesThatSums2020(expenses: [Int]) -> Int {
        
        for firstExpense in expenses {
            
            let secondExpense = 2020 - firstExpense
            
            if expenses.contains(secondExpense) {
                return firstExpense * secondExpense
            }
        }
        
        return 0
    }
    
    func multiplyThreeExpensesThatSums2020(expenses: [Int]) -> Int {

        for firstExpense in expenses {
            
            for secondExpense in expenses {
                
                let thirdExpense = 2020 - firstExpense - secondExpense
                
                if expenses.contains(thirdExpense) {
                    return firstExpense * secondExpense * thirdExpense
                }
            }
        }
        
        return 0
    }
}
