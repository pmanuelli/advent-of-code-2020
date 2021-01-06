struct PassportFieldsValidator {
    
    private let mandatoryFields: Set<String>
    
    init(mandatoryFields: Set<String>) {
        self.mandatoryFields = mandatoryFields
    }
    
    func isValidData(_ passportData: [String: String]) -> Bool {
        mandatoryFields.allSatisfy { passportData[$0] != nil }
    }
    
    func countNumberOfValidData<T: Sequence>(batch: T) -> Int where T.Element == [String: String] {
        batch.reduce(0) { isValidData($1) ? $0 + 1 : $0 }
    }
}
