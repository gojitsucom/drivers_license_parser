import 'package:drivers_license_parser/src/field_parser.dart';
import 'package:drivers_license_parser/src/license.dart';
import 'package:drivers_license_parser/src/regex.dart';

import 'version_one_field_parser.dart';
import 'version_three_parser.dart';
import 'version_two_parser.dart';

/// A Parser for creating ParsedLicense objects
class LicenseParser {
  ///
  ///   Parses the AAMVA PDF417 raw barcode data based on the specific AAMVA document version
  ///
  ///   - Returns: A ParsedLicense with all available parsed fields
  ///
  static License parse(String data) {
    final fieldParser = versionBasedFieldParsing(data: data);

    return License(
      firstName: fieldParser.parseFirstName(),
      lastName: fieldParser.parseLastName(),
      middleName: fieldParser.parseMiddleName(),
      expirationDate: fieldParser.parseExpirationDate(),
      issueDate: fieldParser.parseIssueDate(),
      dateOfBirth: fieldParser.parseDateOfBirth(),
      gender: fieldParser.parseGender(),
      eyeColor: fieldParser.parseEyeColor(),
      height: fieldParser.parseHeight(),
      streetAddress: fieldParser.parseString("streetAddress"),
      city: fieldParser.parseString("city"),
      state: fieldParser.parseString("state"),
      postalCode: fieldParser.parsePostalCode(),
      customerId: fieldParser.parseString("customerId"),
      documentId: fieldParser.parseString("documentId"),
      country: fieldParser.parseCountry(),
      middleNameTruncation:
          fieldParser.parseTruncationStatus("middleNameTruncation"),
      firstNameTruncation:
          fieldParser.parseTruncationStatus("firstNameTruncation"),
      lastNameTruncation:
          fieldParser.parseTruncationStatus("lastNameTruncation"),
      streetAddressSupplement:
          fieldParser.parseString("streetAddressSupplement"),
      hairColor: fieldParser.parseHairColor(),
      placeOfBirth: fieldParser.parseString("placeOfBirth"),
      auditInformation: fieldParser.parseString("auditInformation"),
      inventoryControlNumber: fieldParser.parseString("inventoryControlNumber"),
      lastNameAlias: fieldParser.parseString("lastNameAlias"),
      firstNameAlias: fieldParser.parseString("firstNameAlias"),
      suffixAlias: fieldParser.parseString("suffixAlias"),
      suffix: fieldParser.parseNameSuffix(),
      version: parseVersion(data),
      pdf417: data,
    );
  }

  static FieldParser versionBasedFieldParsing({
    required String data,
  }) {
    final version = parseVersion(data);
    switch (version) {
      case "01":
        return VersionOneFieldParser(data);
      case "02":
        return VersionTwoFieldParser(data);
      case "03":
        return VersionThreeFieldParser(data);
      default:
        return FieldParser(data: data);
    }
  }

  static String? parseVersion(String data) {
    return LicenseRegex.firstMatch(pattern: "\\d{6}(\\d{2})\\w+", data: data);
  }
}
