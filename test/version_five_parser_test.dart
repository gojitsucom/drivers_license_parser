// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/license_date_parser.dart';
import 'package:drivers_license_parser/src/postal_code.dart';
import 'package:test/test.dart';

void main() {
  group("Parsing AAMVA 2010 DL/ID Card Standard aka Version 5", () {
    test("should correctly parse all available fields", () {
      final result = LicenseParser.parse(licenseData());

      expect(result.firstName, "JOHN");
      expect(result.firstNameAlias, isNull);
      expect(result.firstNameTruncation, Truncation.unknown);
      expect(result.lastName, "PUBLIC");
      expect(result.lastNameAlias, isNull);
      expect(result.lastNameTruncation, Truncation.unknown);
      expect(result.middleName, "QUINCY");
      expect(result.middleNameTruncation, Truncation.unknown);
      expect(result.expirationDate,
          LicenseDateParser.monthDayYear.parse("08112019"));
      expect(
          result.issueDate, LicenseDateParser.monthDayYear.parse("10092015"));
      expect(result.gender, Gender.male);
      expect(result.eyeColor, EyeColor.brown);
      expect(result.height, 69);
      expect(result.streetAddress, "454 APRICOT RD");
      expect(result.city, "LITTLE ROCK");
      expect(result.state, "AR");
      expect(
          result.postalCode,
          PostalCode(
            postalCode: "11111 2222",
          )); // "11111 2222"
      expect(result.customerId, "123456789");
      expect(result.documentId, isNull);
      expect(result.country, IssuingCountry.unitedStates);
      expect(result.streetAddressSupplement, isNull);
      expect(result.hairColor, HairColor.unknown);
      expect(
          result.dateOfBirth, LicenseDateParser.monthDayYear.parse("08111972"));
      expect(result.auditInformation, isNull);
      expect(result.inventoryControlNumber, isNull);
      expect(result.suffixAlias, isNull);
      expect(result.suffix, NameSuffix.unknown);
      expect(result.version, "05");
    });
  });
}

String licenseData() {
  final data =
      "@\n\nANSI 636021050002DL00410229ZA02700014DLDCB\nDAQ123456789\nDCAD\nDAK11111 2222 \nDAJAR\nDAILITTLE ROCK\nDAG454 APRICOT RD\nDDGU\nDDFU\nDADQUINCY\nDDEU\nDACJOHN\nDDD0\nDDB09152012\nDDAN\nDBD10092015\nDCSPUBLIC\nDBC1\nDBB08111972\nDBA08112019\nDCLW\nDCK\nDAYBRO\nDCGUSA\nDCF\nDAU069 in\nDCDM\nZAZAB6003\nZAA\n";

  return data;
}
