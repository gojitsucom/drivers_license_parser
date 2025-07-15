import 'package:drivers_license_parser/src/enum.dart';
import 'package:drivers_license_parser/src/regex.dart';

import 'field_mapper.dart';
import 'field_parser.dart';
import 'license_date_parser.dart';

class VersionOneFieldMapper extends FieldMapper {
  static const driverLicenseName = "driverLicenseName";

  static const versionOneFieldMapperOverrides = {
    FieldMapper.lastName: "DAB",
    driverLicenseName: "DAA",
  };

  VersionOneFieldMapper()
      : super(fields: {
          ...FieldMapper.standardFieldMappings,
          ...versionOneFieldMapperOverrides,
        });
}

class VersionOneFieldParser extends FieldParser {
  VersionOneFieldParser(String data,
      {required super.dateFormatLocale})
      : super(
          data: data,
          fieldMapper: VersionOneFieldMapper(),
        );

  @override
  String? parseDriversLicenseNumber() {
    return super.parseDriversLicenseNumber() ??
        parseString(
          FieldMapper.uniqueCustomerId,
          matchLineStartOnly: false,
        );
  }

  /// Version 1 of the spec calls for CCYYMMDD for all machine-readable dates
  @override
  LicenseDateParser licenseDateParser = LicenseDateParser.yearMonthDay;

  @override
  String? parseFirstName() {
    return parseString(FieldMapper.firstName) ??
        parseDriverLicenseName(FieldMapper.firstName);
  }

  @override
  String? parseLastName() {
    return parseString(FieldMapper.lastName) ??
        parseDriverLicenseName(FieldMapper.lastName);
  }

  @override
  String? parseMiddleName() {
    return parseString(FieldMapper.middleName) ??
        parseDriverLicenseName(FieldMapper.middleName);
  }

  /// Parse something like 508 (5'8") into 68"
  @override
  double? parseHeight() {
    final heightInFeedAndInches = parseString(FieldMapper.height);
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
    var suffix = parseDriverLicenseName(FieldMapper.suffix) ??
        parseString(FieldMapper.suffix);

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
    final driverLicenseName = parseString(
      VersionOneFieldMapper.driverLicenseName,
      matchLineStartOnly: false,
    );
    if (driverLicenseName == null) {
      return null;
    }
    final namePieces = driverLicenseName.split(",");
    switch (key) {
      case FieldMapper.lastName:
        if (namePieces.isEmpty) {
          return null;
        } else {
          return namePieces[0];
        }
      case FieldMapper.firstName:
        if (namePieces.length <= 1) {
          return null;
        } else {
          return namePieces[1];
        }
      case FieldMapper.middleName:
        if (namePieces.length <= 2) {
          return null;
        } else {
          return namePieces[2];
        }
      case FieldMapper.suffix:
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
