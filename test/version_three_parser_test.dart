// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/license_date_parser.dart';
import 'package:drivers_license_parser/src/postal_code.dart';
import 'package:test/test.dart';

void main() {
  group("Parsing version three of the AAMVA standard", () {
    test("should parse the required fields", () {
      final rawData =
          "@\n\nANSI 636012030001DL00000367DLDCAG2  \nDCBX\nDCDNONE\nDBA04252025\nDCSPUBLIC,\nDCTJOHN\nDBD09102015\nDBB03281974\nDBC1\nDAYNONE\nDAU170 cm\nDAG789 E OAK AVE,\nDAIVANCOUVER\nDAJBC\nDAKA5K 4X9\nDAQM1234-12345-12345\nDCFAB1234567\nDCGCAN\nDCHNONE\nDCK*1234567*";

      final result = LicenseParser.parse(rawData);

      expect(result.gender, Gender.male);
      expect(result.firstName, "JOHN");
      expect(result.lastName, "PUBLIC");
      expect(result.streetAddress, "789 E OAK AVE");
      expect(result.postalCode, PostalCode(postalCode: "A5K 4X9")); //"A5K 4X9"
      //"20250425"
      expect(result.expirationDate, DateTime(2025, 4, 25));
      //"19740328"
      expect(result.dateOfBirth, DateTime(1974, 3, 28));
      //"20150910"
      expect(result.issueDate, DateTime(2015, 9, 10));
      expect(result.eyeColor, EyeColor.unknown);
      expect(result.country, IssuingCountry.canada);
    });
  });
}

DateTime? formattedDate(String date) {
  return LicenseDateParser.monthDayYear.parse(date);
}
