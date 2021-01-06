struct ValidPasswordsCounter {
        
    func numberOfValidPasswords(_ passwordsAndPolicies: [(Policy, Password)]) -> Int {
        return passwordsAndPolicies
            .filter { $0.0.validates($0.1) }
            .count
    }
}
