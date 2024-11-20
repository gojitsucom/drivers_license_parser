// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/field_parser.dart';
import 'package:test/test.dart';

void main() {
  test("Canadian dates are parsed correctly", () {
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

    final result = LicenseParser.parse(
      rawData,
      dateFormatLocale: DateFormatLocale.canadian,
    );

    expect(result.expirationDate, DateTime(2025, 4, 25));
    expect(result.dateOfBirth, DateTime(1974, 3, 28));
    expect(result.issueDate, DateTime(2015, 9, 10));
  });

  test("US format does not apply to version one", () {
    final rawData = "@\n" +
        "\n" +
        "ANSI 636026010102DL00410288ZA03290015DLDBJD12345678\n" +
        "DABPUBLIC\n" +
        "DACJOHN\n" +
        "DADQUINCY\n" +
        "DAG789 E OAK ST\n" +
        "DAIANYTOWN\n" +
        "DAHAPT #4A\n" +
        "DAJCA\n" +
        "DAK90223\n" +
        "DBB19700115\n" +
        "DBA20350131\n" +
        "DAU509\n" +
        "DAW180\n" +
        "DAZBR\n" +
        "DAYGRN\n" +
        "DBC1\n" +
        "DBHN\n" +
        "DARD\n" +
        "DBD20131003\n" +
        "DBE2013-10-03 00.00.00.000000\n" +
        "DBIN\n" +
        "ZAZAA7V81\n";

    final result = LicenseParser.parse(
      rawData,
      dateFormatLocale: DateFormatLocale.us,
    );

    expect(result.expirationDate, DateTime(2035, 1, 31));
    expect(result.dateOfBirth, DateTime(1970, 1, 15));
    expect(result.issueDate, DateTime(2013, 10, 3));
  });
}
