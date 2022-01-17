/// A basic Field Mapping implementation based on the AAMVA Version 8 standard
class FieldMapper {
  static const standardFieldMappings = <String, String>{
    "firstName": "DAC",
    "lastName": "DCS",
    "middleName": "DAD",
    "expirationDate": "DBA",
    "issueDate": "DBD",
    "dateOfBirth": "DBB",
    "gender": "DBC",
    "eyeColor": "DAY",
    "height": "DAU",
    "streetAddress": "DAG",
    "city": "DAI",
    "state": "DAJ",
    "postalCode": "DAK",
    "customerId": "DAQ",
    "documentId": "DCF",
    "country": "DCG",
    "middleNameTruncation": "DDG",
    "firstNameTruncation": "DDF",
    "lastNameTruncation": "DDE",
    "streetAddressSupplement": "DAH",
    "hairColor": "DAZ",
    "placeOfBirth": "DCI",
    "auditInformation": "DCJ",
    "inventoryControlNumber": "DCK",
    "lastNameAlias": "DBN",
    "firstNameAlias": "DBG",
    "suffixAlias": "DBS",
    "suffix": "DCU"
  };

  /// A list of AAMVA field designator mappings (e.g. "firstName" => "DAC")
  final Map<String, String> fields;

  const FieldMapper({this.fields = standardFieldMappings});

  ///
  ///    Determine the AAMVA field designator for a particular human readable key.
  ///
  ///    - Parameters:
  ///      - key: The human readable key
  ///
  ///    - Returns: The AAMVA field designator
  ///
  String fieldFor(String key) {
    final fieldValue = fields[key];

    return fieldValue ?? "";
  }
}
