import 'package:drivers_license_parser/src/postal_code.dart';

import 'enum.dart';

/// Represents the behavior of a parsed license
class License {
  /// The license holder's first/given name
  final String? firstName;

  /// The license holder's last/given name
  final String? lastName;

  /// The license holder's middle name
  final String? middleName;

  /// The expiration date of the license
  final DateTime? expirationDate;

  /// The issue date of the license
  final DateTime? issueDate;

  /// The license holder's date of birth
  final DateTime? dateOfBirth;

  /// The license holder's gender
  final Gender? gender;

  /// The license holder's eye color
  final EyeColor? eyeColor;

  /// The license holder's height
  final double? height;

  /// The license holder's street address
  final String? streetAddress;

  /// The license holder's city
  final String? city;

  /// The license holder's state
  final String? state;

  /// The license holder's postal code
  final PostalCode? postalCode;

  /// This is usually the [customerId] but it can also be the [uniqueCustomerId]
  final String? driversLicenseNumber;

  /// The license holder's customer Id (e.g. Driver License Number). You generally want to use [driversLicenseNumber] instead of this directly.
  final String? customerId;

  /// Only available in version 1. You generally want to use [driversLicenseNumber] instead of this directly.
  final String? uniqueCustomerId;

  /// A unique document identifier
  final String? documentId;

  /// The license's issuing country
  final IssuingCountry? country;

  /// A determination of if the middle name was truncated
  final Truncation? middleNameTruncation;

  /// A determination of if the first name was truncated
  final Truncation? firstNameTruncation;

  /// A determination of if the last name was truncated
  final Truncation? lastNameTruncation;

  /// The license holder's supplemental street address
  final String? streetAddressSupplement;

  /// The license holder's hair color
  final HairColor? hairColor;

  /// The license holder's place of birth
  final String? placeOfBirth;

  /// The license issuer's audit information
  final String? auditInformation;

  /// The license issuer's
  final String? inventoryControlNumber;

  /// The license holder's last name alias
  final String? lastNameAlias;

  /// The license holder's first name alias
  final String? firstNameAlias;

  /// The license holder's name suffix alias
  final String? suffixAlias;

  /// The license holder's name suffix
  final NameSuffix? suffix;

  /// The AAMVA version to which this parsed license conforms
  final String? version;

  /// The raw pdf417 scan data used to build this parsed license
  final String? pdf417;

  License({
    this.firstName,
    this.lastName,
    this.middleName,
    this.expirationDate,
    this.issueDate,
    this.dateOfBirth,
    this.gender,
    this.eyeColor,
    this.height,
    this.streetAddress,
    this.city,
    this.state,
    this.postalCode,
    this.customerId,
    this.uniqueCustomerId,
    required this.driversLicenseNumber,
    this.documentId,
    this.country,
    this.middleNameTruncation,
    this.firstNameTruncation,
    this.lastNameTruncation,
    this.streetAddressSupplement,
    this.hairColor,
    this.placeOfBirth,
    this.auditInformation,
    this.inventoryControlNumber,
    this.lastNameAlias,
    this.firstNameAlias,
    this.suffixAlias,
    this.suffix,
    this.version,
    this.pdf417,
  });

  bool isExpired() {
    if (expirationDate == null || DateTime.now().isBefore(expirationDate!)) {
      return false;
    }
    return true;
  }

  bool hasBeenIssued() {
    if (issueDate == null || DateTime.now().isBefore(issueDate!)) {
      return false;
    }
    return true;
  }

  bool isAcceptable() {
    if (isExpired() || !hasBeenIssued()) {
      return false;
    }
    if (expirationDate == null ||
        lastName == null ||
        firstName == null ||
        middleName == null ||
        issueDate == null ||
        dateOfBirth == null ||
        height == null ||
        streetAddress == null ||
        city == null ||
        state == null ||
        postalCode == null ||
        documentId == null) {
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return '''
License{
  firstName: $firstName,
  lastName: $lastName,
  middleName: $middleName,
  expirationDate: $expirationDate,
  issueDate: $issueDate,
  dateOfBirth: $dateOfBirth,
  gender: $gender,
  eyeColor: $eyeColor,
  height: $height,
  streetAddress: $streetAddress,
  city: $city,
  state: $state,
  postalCode: $postalCode,
  driversLicenseNumber: $driversLicenseNumber,
  customerId: $customerId,
  uniqueCustomerId: $uniqueCustomerId,
  documentId: $documentId,
  country: $country,
  middleNameTruncation: $middleNameTruncation,
  firstNameTruncation: $firstNameTruncation,
  lastNameTruncation: $lastNameTruncation,
  streetAddressSupplement: $streetAddressSupplement,
  hairColor: $hairColor,
  placeOfBirth: $placeOfBirth,
  auditInformation: $auditInformation,
  inventoryControlNumber: $inventoryControlNumber,
  lastNameAlias: $lastNameAlias,
  firstNameAlias: $firstNameAlias,
  suffixAlias: $suffixAlias,
  suffix: $suffix,
  version: $version,
  pdf417: $pdf417
}
''';
  }
}
