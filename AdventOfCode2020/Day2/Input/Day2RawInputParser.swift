struct Day2RawInputParser {
    
    static func parse(raw: String, policyFactory: PolicyFactory) -> [(Policy, Password)] {
        raw.components(separatedBy: .newlines).map {
            
            let lineComponents = $0.components(separatedBy: ":")
            let policyRaw = lineComponents[0]
            let passwordRaw = lineComponents[1].trimmingCharacters(in: .whitespaces)
            return (policyFactory.create(from: policyRaw), Password(raw: passwordRaw))
        }
    }
}
