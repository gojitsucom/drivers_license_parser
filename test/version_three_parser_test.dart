// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/license_date_parser.dart';
import 'package:test/test.dart';

void main() {
  group("Parsing version three of the AAMVA standard", () {
    test("should parse the required fields", () {
      final rawData = "@\n" +
          "\n" +
          "ANSI 636012030001DL00000367DLDCAG2  \n" +
          "DCBX\n" +
          "DCDNONE\n" +
          "DBA20250425\n" +
          "DCSPUBLIC,\n" +
          "DCTJOHN\n" +
          "DBD20150910\n" +
          "DBB19740328\n" +
          "DBC1\n" +
          "DAYNONE\n" +
          "DAU170 cm\n" +
          "DAG789 E OAK AVE,\n" +
          "DAIVANCOUVER\n" +
          "DAJBC\n" +
          "DAKA5K 4X9\n" +
          "DAQM1234-12345-12345\n" +
          "DCFAB1234567\n" +
          "DCGCAN\n" +
          "DCHNONE\n" +
          "DCK*1234567*";

      final result = LicenseParser.parse(rawData);

      expect(result.gender, Gender.male);
      expect(result.firstName, "JOHN");
      expect(result.lastName, "PUBLIC");
      expect(result.streetAddress, "789 E OAK AVE");
      expect(result.postalCode, "A5K 4X9");
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
  return LicenseDateParser.yearMonthDay.parse(date);
}
