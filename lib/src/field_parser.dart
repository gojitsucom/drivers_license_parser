import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/field_mapper.dart';
import 'package:drivers_license_parser/src/license_date_parser.dart';
import 'package:drivers_license_parser/src/postal_code.dart';
import 'package:drivers_license_parser/src/regex.dart';

import 'enum.dart';

enum DateFormatLocale {
  us,
  canadian,
}

class FieldParser {
  /// Used to convert cm to inches for height calculations
  static final double inchesPerCentimeter = 0.393701;

  /// A Field Mapping object for finding fields in the raw data
  final FieldMapper fieldMapper;

  /// The raw data from an AAMVA spec adhering PDF-417 barcode
  final String data;

  final DateFormatLocale dateFormatLocale;

  ///
  ///   Initializes a new Field Parser
  ///   - Parameters:
  ///   - data: The AAMVA spec adhering PDF-417 barcode data
  ///   - fieldMapper: A FieldMapping object
  ///   - Returns: An initialized Field Parser
  FieldParser({
    required this.data,
    this.fieldMapper = const FieldMapper(),
    required this.dateFormatLocale,
  });

  ///
  ///  Parse a string out of the raw data
  ///  - Parameters:
  ///  - The human readable key we're looking for
  ///  - Returns: An optional value parsed out of the raw data
  ///
  String? parseString(String key, {bool matchLineStartOnly = true}) {
    final identifier = fieldMapper.fieldFor(key);
    final result = LicenseRegex.firstMatch(
      pattern: '$identifier(.+)\\b',
      data: data,
      matchLineStartOnly: matchLineStartOnly,
    );
    if (result == 'NONE') {
      return null;
    }
    return result;
  }

  ///
  /// Parse a double out of the raw data.
  /// - Parameters:
  /// - The human readable key we're looking for
  /// - Returns: An optional value parsed out of the raw data
  ///
  double? parseDouble(String key, {bool matchLineStartOnly = true}) {
    final identifier = fieldMapper.fieldFor(key);
    final result = LicenseRegex.firstMatch(
      pattern: "$identifier(\\w+)\\b",
      data: data,
      matchLineStartOnly: matchLineStartOnly,
    );
    if (result == null) return null;
    return double.tryParse(result);
  }

  ///
  /// Parse a date out of the raw data
  /// - Parameters:
  /// - The human readable key we're looking for
  /// - Returns: An optional value parsed out of the raw data
  ///
  DateTime? parseDate(String field, {bool matchLineStartOnly = true}) {
    final dateString = parseString(
      field,
      matchLineStartOnly: matchLineStartOnly,
    );
    if (dateString == null || dateString.isEmpty) {
      return null;
    }
    return licenseDateParser.parse(dateString);
  }

  /// All specs besides version 1 call for locale-specific date parsing.
  /// US: MMDDCCYY
  /// CAN: CCYYMMDD
  LicenseDateParser get licenseDateParser {
    if (dateFormatLocale == DateFormatLocale.canadian) {
      return LicenseDateParser.yearMonthDay;
    } else {
      return LicenseDateParser.monthDayYear;
    }
  }

  String? parseDriversLicenseNumber() {
    return parseString(FieldMapper.customerId, matchLineStartOnly: false);
  }

  ///
  /// Parse the AAMVA last name out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  String? parseFirstName() {
    return parseString(FieldMapper.firstName, matchLineStartOnly: true);
  }

  ///
  /// Parse the AAMVA last name out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  String? parseLastName() {
    return parseString(FieldMapper.lastName, matchLineStartOnly: true);
  }

  ///
  /// Parse the AAMVA middle name out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  String? parseMiddleName() {
    return parseString(FieldMapper.middleName, matchLineStartOnly: true);
  }

  ///
  /// Parse the AAMVA expiration date out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  DateTime? parseExpirationDate() {
    return parseDate(FieldMapper.expirationDate) ??
        parseDate(FieldMapper.expirationDateAlt);
  }

  ///
  /// Parse the AAMVA issue date out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  DateTime? parseIssueDate() {
    return parseDate(FieldMapper.issueDate);
  }

  ///
  /// Parse the AAMVA date of birth out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  DateTime? parseDateOfBirth() {
    return parseDate(FieldMapper.dateOfBirth);
  }

  ///
  /// Parse the AAMVA issuing country out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  IssuingCountry parseCountry() {
    final country = parseString(FieldMapper.country);
    if (country == null) {
      return IssuingCountry.unknown;
    }
    switch (country) {
      case "USA":
        return IssuingCountry.unitedStates;
      case "CAN":
        return IssuingCountry.canada;
      default:
        return IssuingCountry.unknown;
    }
  }

  ///
  /// Parse the AAMVA name truncation statuses out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  Truncation parseTruncationStatus(String field) {
    final truncation = parseString(field);
    if (truncation == null) {
      return Truncation.unknown;
    }

    switch (truncation) {
      case "T":
        return Truncation.truncated;
      case "N":
        return Truncation.none;
      default:
        return Truncation.unknown;
    }
  }

  ///
  /// Parse the AAMVA gender out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  Gender parseGender() {
    final gender = parseString(FieldMapper.gender);
    if (gender == null) {
      return Gender.unknown;
    }

    switch (gender) {
      case "1":
        return Gender.male;
      case "2":
        return Gender.female;
      default:
        return Gender.other;
    }
  }

  ///
  /// Parse the AAMVA eye color out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  EyeColor parseEyeColor() {
    final color = parseString(FieldMapper.eyeColor);
    if (color == null) {
      return EyeColor.unknown;
    }
    switch (color) {
      case "BLK":
        return EyeColor.black;
      case "BLU":
        return EyeColor.blue;
      case "BRO":
        return EyeColor.brown;
      case "GRY":
        return EyeColor.gray;
      case "GRN":
        return EyeColor.green;
      case "HAZ":
        return EyeColor.hazel;
      case "MAR":
        return EyeColor.maroon;
      case "PNK":
        return EyeColor.pink;
      case "DIC":
        return EyeColor.dichromatic;
      default:
        return EyeColor.unknown;
    }
  }

  ///
  /// Parse the AAMVA name suffix out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  NameSuffix parseNameSuffix() {
    final suffix = parseString(FieldMapper.suffix);
    if (suffix == null) {
      return NameSuffix.unknown;
    }

    switch (suffix) {
      case "JR":
        return NameSuffix.junior;
      case "SR":
        return NameSuffix.senior;
      case "1ST":
      case "I":
        return NameSuffix.first;
      case "2ND":
      case "II":
        return NameSuffix.second;
      case "3RD":
      case "III":
        return NameSuffix.third;
      case "4TH":
      case "IV":
        return NameSuffix.fourth;
      case "5TH":
      case "V":
        return NameSuffix.fifth;
      case "6TH":
      case "VI":
        return NameSuffix.sixth;
      case "7TH":
      case "VII":
        return NameSuffix.seventh;
      case "8TH":
      case "VIII":
        return NameSuffix.eighth;
      case "9TH":
      case "IX":
        return NameSuffix.ninth;
      default:
        return NameSuffix.unknown;
    }
  }

  ///
  /// Parse the AAMVA hair color out of the raw data
  /// - Returns: An optional value parsed out of the raw data
  ///
  HairColor parseHairColor() {
    final color = parseString(FieldMapper.hairColor);
    if (color == null) {
      return HairColor.unknown;
    }

    switch (color) {
      case "BAL":
        return HairColor.bald;
      case "BLK":
        return HairColor.black;
      case "BLN":
        return HairColor.blond;
      case "BRO":
        return HairColor.brown;
      case "GRY":
        return HairColor.grey;
      case "RED":
        return HairColor.red;
      case "SDY":
        return HairColor.sandy;
      case "WHI":
        return HairColor.white;
      default:
        return HairColor.unknown;
    }
  }

  ///
  /// Parse the AAMVA height out of the raw data
  /// - Returns: An optional value parsed out of the raw data in inches
  ///
  double? parseHeight() {
    final heightString = parseString(FieldMapper.height);
    final height = parseDouble(FieldMapper.height);
    if (heightString == null || height == null) {
      return null;
    }

    if (heightString.contains("cm")) {
      return (height * FieldParser.inchesPerCentimeter).roundToDouble();
    } else {
      return height;
    }
  }

  /// postal codes can include both the base 5-digit code and the 4-digit routing code
  /// this splits them up and makes it easy to work with
  PostalCode? parsePostalCode() {
    final postalCodeString = parseString(FieldMapper.postalCode);
    if (postalCodeString != null) {
      if (postalCodeString.length == 9) {
        return PostalCode(
          postalCode: postalCodeString.substring(0, 5),
          extension: postalCodeString.substring(5, 9),
        );
      } else {
        return PostalCode(postalCode: postalCodeString);
      }
    }
    return null;
  }
}
