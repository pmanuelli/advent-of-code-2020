struct PassportFieldsAndValuesValidator {
    
    private let mandatoryFields: [Field]
    
    init(mandatoryFields: [Field]) {
        self.mandatoryFields = mandatoryFields
    }
    
    func isValidData(_ passportData: [String: String]) -> Bool {
        mandatoryFields.allSatisfy {
            guard let value = passportData[$0.key] else { return false }
            return $0.isValidValue(value)
        }
    }
    
    func countNumberOfValidData<T: Sequence>(batch: T) -> Int where T.Element == [String: String] {
        batch.reduce(0) { isValidData($1) ? $0 + 1 : $0 }
    }
}
