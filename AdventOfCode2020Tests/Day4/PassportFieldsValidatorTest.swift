import XCTest

class PassportFieldsValidatorTest: XCTestCase {

    private let field1Name = "field_1"
    private let field2Name = "field_2"
    
    private lazy var validator = PassportFieldsValidator(mandatoryFields: [field1Name, field2Name])
    
    func testValidationSucceedsIfContainsAllMandatoryFields() {
        
        let data = [field1Name: "field_1_value", field2Name: "field_2_value"]
        
        XCTAssertTrue(validator.isValidData(data))
    }
    
    func testValidationFailsIfAtLeastOneMandatoryFieldIsNotPresent() {
        
        let data = [field1Name: "field_1_value"]
        
        XCTAssertFalse(validator.isValidData(data))
    }
    
    func testValidationIgnoresExtraFields() {
        
        let data = [field1Name: "field_1_value",
                    field2Name: "field_2_value",
                    "extra_field" : "extra_field_value"]

        XCTAssertTrue(validator.isValidData(data))
    }
    
    func testValidatesDataInBatchReturningNumberOfValidSetsOfData() {
        
        let validData = [field1Name: "field_1_value",
                         field2Name: "field_2_value"]
        
        let invalidData = [field1Name: "field_1_value"]
        
        let batch = [validData, invalidData, validData]
        
        XCTAssertEqual(2, validator.countNumberOfValidData(batch: batch))
    }
    
    func testExampleData() {
        
        let fields = PassportDataMandatoryFields.fields.map { $0.key }
        let validator = PassportFieldsValidator(mandatoryFields: fields)
        
        let batch = Day4RawInputParser.parse(raw: PassportDataRawInput.firstHalfExample)
        
        XCTAssertEqual(2, validator.countNumberOfValidData(batch: batch))
    }
}
