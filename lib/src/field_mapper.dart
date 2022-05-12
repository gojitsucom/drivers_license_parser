/// A basic Field Mapping implementation based on the AAMVA Version 8 standard
class FieldMapper {
  static const firstName = "firstName";
  static const lastName = "lastName";
  static const middleName = "middleName";
  static const expirationDate = "expirationDate";
  static const issueDate = "issueDate";
  static const dateOfBirth = "dateOfBirth";
  static const gender = "gender";
  static const eyeColor = "eyeColor";
  static const height = "height";
  static const streetAddress = "streetAddress";
  static const city = "city";
  static const state = "state";
  static const postalCode = "postalCode";
  /// this is the drivers license number most of the time
  static const customerId = "customerId";
  /// sometimes this is the drivers license number in V1 :(
  static const uniqueCustomerId = "uniqueCustomerId";
  static const documentId = "documentId";
  static const country = "country";
  static const middleNameTruncation = "middleNameTruncation";
  static const firstNameTruncation = "firstNameTruncation";
  static const lastNameTruncation = "lastNameTruncation";
  static const streetAddressSupplement = "streetAddressSupplement";
  static const hairColor = "hairColor";
  static const placeOfBirth = "placeOfBirth";
  static const auditInformation = "auditInformation";
  static const inventoryControlNumber = "inventoryControlNumber";
  static const lastNameAlias = "lastNameAlias";
  static const firstNameAlias = "firstNameAlias";
  static const suffixAlias = "suffixAlias";
  static const suffix = "suffix";
  static const standardFieldMappings = <String, String>{
    firstName: "DAC",
    lastName: "DCS",
    middleName: "DAD",
    expirationDate: "DBA",
    issueDate: "DBD",
    dateOfBirth: "DBB",
    gender: "DBC",
    eyeColor: "DAY",
    height: "DAU",
    streetAddress: "DAG",
    city: "DAI",
    state: "DAJ",
    postalCode: "DAK",
    customerId: "DAQ",
    uniqueCustomerId: "DBJ",
    documentId: "DCF",
    country: "DCG",
    middleNameTruncation: "DDG",
    firstNameTruncation: "DDF",
    lastNameTruncation: "DDE",
    streetAddressSupplement: "DAH",
    hairColor: "DAZ",
    placeOfBirth: "DCI",
    auditInformation: "DCJ",
    inventoryControlNumber: "DCK",
    lastNameAlias: "DBN",
    firstNameAlias: "DBG",
    suffixAlias: "DBS",
    suffix: "DCU",
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
