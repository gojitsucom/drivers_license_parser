// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/field_parser.dart';
import 'package:test/test.dart';

void main() {
  test("Canadian dates are parsed correctly", () {
    final rawData =
        "@\n\nANSI 636012030001DL00000367DLDCAG2  \nDCBX\nDCDNONE\nDBA20250425\nDCSPUBLIC,\nDCTJOHN\nDBD20150910\nDBB19740328\nDBC1\nDAYNONE\nDAU170 cm\nDAG789 E OAK AVE,\nDAIVANCOUVER\nDAJBC\nDAKA5K 4X9\nDAQM1234-12345-12345\nDCFAB1234567\nDCGCAN\nDCHNONE\nDCK*1234567*";

    final result = LicenseParser.parse(
      rawData,
      dateFormatLocale: DateFormatLocale.canadian,
    );

    expect(result.expirationDate, DateTime(2025, 4, 25));
    expect(result.dateOfBirth, DateTime(1974, 3, 28));
    expect(result.issueDate, DateTime(2015, 9, 10));
  });

  test("US format does not apply to version one", () {
    final rawData =
        "@\n\nANSI 636026010102DL00410288ZA03290015DLDBJD12345678\nDABPUBLIC\nDACJOHN\nDADQUINCY\nDAG789 E OAK ST\nDAIANYTOWN\nDAHAPT #4A\nDAJCA\nDAK90223\nDBB19700115\nDBA20350131\nDAU509\nDAW180\nDAZBR\nDAYGRN\nDBC1\nDBHN\nDARD\nDBD20131003\nDBE2013-10-03 00.00.00.000000\nDBIN\nZAZAA7V81\n";

    final result = LicenseParser.parse(
      rawData,
      dateFormatLocale: DateFormatLocale.us,
    );

    expect(result.expirationDate, DateTime(2035, 1, 31));
    expect(result.dateOfBirth, DateTime(1970, 1, 15));
    expect(result.issueDate, DateTime(2013, 10, 3));
  });
}
