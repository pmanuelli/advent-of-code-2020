import XCTest

class PassportFieldsAndValuesValidatorTest: XCTestCase {

    private let field1Key = "field_1"
    private let field2Key = "field_2"
    private let field3Key = "field_3"
    
    func testValidationSucceedsIfContainsAllMandatoryFieldsWithValidValues() {
        
        let field1 = MockField(key: field1Key, isValidValue: true)
        let field2 = MockField(key: field2Key, isValidValue: true)
        
        let validator = PassportFieldsAndValuesValidator(mandatoryFields: [field1, field2])

        let data = [field1Key: "field_1_value",
                    field2Key: "field_2_value"]
        
        XCTAssertTrue(validator.isValidData(data))
    }
    
    func testValidationFailsIfContainsAllMandatoryFieldsWithButWithSomeInvalidValue() {
        
        let field1 = MockField(key: field1Key, isValidValue: true)
        let field2 = MockField(key: field1Key, isValidValue: false)
        let field3 = MockField(key: field3Key, isValidValue: true)
        
        let validator = PassportFieldsAndValuesValidator(mandatoryFields: [field1, field2, field3])

        let data = [field1Key: "field_1_value",
                    field2Key: "field_2_value",
                    field3Key: "field_3_value"]
        
        XCTAssertFalse(validator.isValidData(data))
    }
    
    func testValidationFailsIfAtLeastOneMandatoryFieldIsNotPresent() {
        
        let field1 = MockField(key: field1Key, isValidValue: true)
        let field2 = MockField(key: field2Key, isValidValue: true)
        
        let validator = PassportFieldsAndValuesValidator(mandatoryFields: [field1, field2])

        let data = [field1Key: "field_1_value"]
        
        XCTAssertFalse(validator.isValidData(data))
    }
    
    func testValidationIgnoresExtraFields() {
        
        let field1 = MockField(key: field1Key, isValidValue: true)
        let field2 = MockField(key: field2Key, isValidValue: true)
        
        let validator = PassportFieldsAndValuesValidator(mandatoryFields: [field1, field2])

        let data = [field1Key: "field_1_value",
                    field2Key: "field_2_value",
                    "extra_field" : "extra_field_value"]

        XCTAssertTrue(validator.isValidData(data))
    }
    
    func testValidatesDataInBatchReturningNumberOfValidSetsOfData() {
        
        let field1 = MockField(key: field1Key, isValidValue: true)
        let field2 = MockField(key: field2Key, isValidValue: true)
        
        let validData = [field1Key: "field_1_value", field2Key: "field_2_value"]
        let invalidData = [field1Key: "field_1_value"]
        
        let validator = PassportFieldsAndValuesValidator(mandatoryFields: [field1, field2])
        
        let batch = [validData, invalidData, validData]
        
        XCTAssertEqual(2, validator.countNumberOfValidData(batch: batch))
    }
    
    func testExampleData() {
        
        let validator = PassportFieldsAndValuesValidator(mandatoryFields: PassportDataMandatoryFields.fields)
        
        let batch = Day4RawInputParser.parse(raw: PassportDataRawInput.secondHalfExample)
        
        XCTAssertEqual(4, validator.countNumberOfValidData(batch: batch))
    }
}

struct MockField: Field {
    
    var key: String
    var isValidValue: Bool
    
    func isValidValue(_ value: String) -> Bool {
        isValidValue
    }
}
