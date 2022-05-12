import 'package:drivers_license_parser/src/field_mapper.dart';
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
  static License parse(String data,
      {DateFormatLocale dateFormatLocale = DateFormatLocale.us}) {
    final fieldParser = versionBasedFieldParsing(
      data: data,
      dateFormatLocale: dateFormatLocale,
    );

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
      streetAddress: fieldParser.parseString(FieldMapper.streetAddress),
      city: fieldParser.parseString(FieldMapper.city),
      state: fieldParser.parseString(FieldMapper.state),
      postalCode: fieldParser.parsePostalCode(),
      customerId: fieldParser.parseString(FieldMapper.customerId),
      uniqueCustomerId: fieldParser.parseString(FieldMapper.uniqueCustomerId),
      driversLicenseNumber: fieldParser.parseDriversLicenseNumber(),
      documentId: fieldParser.parseString(FieldMapper.documentId),
      country: fieldParser.parseCountry(),
      middleNameTruncation:
          fieldParser.parseTruncationStatus(FieldMapper.middleNameTruncation),
      firstNameTruncation:
          fieldParser.parseTruncationStatus(FieldMapper.firstNameTruncation),
      lastNameTruncation:
          fieldParser.parseTruncationStatus(FieldMapper.lastNameTruncation),
      streetAddressSupplement:
          fieldParser.parseString(FieldMapper.streetAddressSupplement),
      hairColor: fieldParser.parseHairColor(),
      placeOfBirth: fieldParser.parseString(FieldMapper.placeOfBirth),
      auditInformation: fieldParser.parseString(FieldMapper.auditInformation),
      inventoryControlNumber: fieldParser.parseString(FieldMapper.inventoryControlNumber),
      lastNameAlias: fieldParser.parseString(FieldMapper.lastNameAlias),
      firstNameAlias: fieldParser.parseString(FieldMapper.firstNameAlias),
      suffixAlias: fieldParser.parseString(FieldMapper.suffixAlias),
      suffix: fieldParser.parseNameSuffix(),
      version: parseVersion(data),
      pdf417: data,
    );
  }

  static FieldParser versionBasedFieldParsing({
    required String data,
    required DateFormatLocale dateFormatLocale,
  }) {
    final version = parseVersion(data);
    switch (version) {
      case "01":
        return VersionOneFieldParser(data, dateFormatLocale: dateFormatLocale);
      case "02":
        return VersionTwoFieldParser(data, dateFormatLocale: dateFormatLocale);
      case "03":
        return VersionThreeFieldParser(data, dateFormatLocale: dateFormatLocale);
      default:
        return FieldParser(data: data, dateFormatLocale: dateFormatLocale);
    }
  }

  static String? parseVersion(String data) {
    return LicenseRegex.firstMatch(pattern: "\\d{6}(\\d{2})\\w+", data: data);
  }
}
