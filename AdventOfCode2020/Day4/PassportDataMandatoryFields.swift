struct PassportDataMandatoryFields {
    
    static let fields: [Field] = [BirthYearField(),
                                  IssueYearField(),
                                  ExpirationYearField(),
                                  HeightField(),
                                  HairColorField(),
                                  EyesColorField(),
                                  PassportIdField()]
}
