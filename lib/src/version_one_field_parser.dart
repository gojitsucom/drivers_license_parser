import 'package:drivers_license_parser/src/enum.dart';
import 'package:drivers_license_parser/src/regex.dart';

import 'field_mapper.dart';
import 'field_parser.dart';
import 'license_date_parser.dart';

class VersionOneFieldMapper extends FieldMapper {
  static const versionOneFieldMapperOverrides = {
    "customerId": "DBJ",
    "lastName": "DAB",
    "driverLicenseName": "DAA",
  };

  VersionOneFieldMapper()
      : super(fields: {
          ...FieldMapper.standardFieldMappings,
          ...versionOneFieldMapperOverrides,
        });
}

class VersionOneFieldParser extends FieldParser {
  VersionOneFieldParser(String data)
      : super(data: data, fieldMapper: VersionOneFieldMapper());

  @override
  LicenseDateParser licenseDateParser = LicenseDateParser.yearMonthDay;

  @override
  String? parseFirstName() {
    return parseString("firstName") ?? parseDriverLicenseName("firstName");
  }

  @override
  String? parseLastName() {
    return parseString("lastName") ?? parseDriverLicenseName("lastName");
  }

  @override
  String? parseMiddleName() {
    return parseString("middleName") ?? parseDriverLicenseName("middleName");
  }

  /// Parse something like 508 (5'8") into 68"
  @override
  double? parseHeight() {
    final heightInFeedAndInches = parseString("height");
    if (heightInFeedAndInches == null) {
      return null;
    }
    final feet = LicenseRegex.firstMatch(
        pattern: "([0-9]{1})", data: heightInFeedAndInches);
    final inches = LicenseRegex.firstMatch(
        pattern: "[0-9]{1}([0-9]{2})", data: heightInFeedAndInches);
    if ((feet == null || feet.isEmpty) || (inches == null || inches.isEmpty)) {
      return null;
    }
    final calculatedHeight = (double.parse(feet) * 12.0) + double.parse(inches);
    if (heightInFeedAndInches.contains("cm")) {
      return (calculatedHeight * FieldParser.inchesPerCentimeter)
          .roundToDouble();
    } else {
      return calculatedHeight;
    }
  }

  @override
  NameSuffix parseNameSuffix() {
    var suffix = parseDriverLicenseName("suffix") ?? parseString("suffix");

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

  String? parseDriverLicenseName(String key) {
    final driverLicenseName = parseString("driverLicenseName");
    if (driverLicenseName == null) {
      return null;
    }
    final namePieces = driverLicenseName.split(",");
    switch (key) {
      case "lastName":
        if (namePieces.isEmpty) {
          return null;
        } else {
          return namePieces[0];
        }
      case "firstName":
        if (namePieces.length <= 1) {
          return null;
        } else {
          return namePieces[1];
        }
      case "middleName":
        if (namePieces.length <= 2) {
          return null;
        } else {
          return namePieces[2];
        }
      case "suffix":
        if (namePieces.length <= 3) {
          return null;
        } else {
          return namePieces[3];
        }
      default:
        return null;
    }
  }
}
